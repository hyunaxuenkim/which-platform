import 'dart:io';
import 'dart:convert';

import 'package:drift/native.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/data/seoul_route_api_client.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_api_response_dto.dart';
import 'package:which_platform/features/route_parser/domain/route_response_parser.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';
import 'package:which_platform/features/route_parser/domain/wrong_platform_localization_audit.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main(List<String> args) async {
  if (args.length == 3) {
    await _runCases(
      label: 'single',
      testCases: <ApiRouteTestCase>[
        ApiRouteTestCase(id: 'ADHOC', start: args[1], end: args[2]),
      ],
    );
    return;
  }

  if (args.length == 4 && args.first.toLowerCase() == 'single') {
    await _runCases(
      label: 'single',
      testCases: <ApiRouteTestCase>[
        ApiRouteTestCase(id: args[1], start: args[2], end: args[3]),
      ],
    );
    return;
  }

  final String phase = args.isEmpty ? 'phase1' : args.first.toLowerCase();
  final List<ApiRouteTestCase>? testCases = _phases[phase];

  if (testCases == null) {
    stderr.writeln('Unknown phase: $phase');
    stderr.writeln(
      'Available phases: ${_phases.keys.join(', ')} or: single <id> <start> <end>',
    );
    exitCode = 64;
    return;
  }

  await _runCases(label: phase, testCases: testCases);
}

Future<void> _runCases({
  required String label,
  required List<ApiRouteTestCase> testCases,
}) async {
  final _RunnerConfig config = await _loadRunnerConfig();
  final SeoulRouteApiClient apiClient = SeoulRouteApiClient(
    apiKey: config.apiKey,
    baseUrl: config.baseUrl,
  );
  const RouteResponseParser parser = RouteResponseParser();
  const RouteViewDataMapper mapper = RouteViewDataMapper();
  const WrongPlatformLocalizationAuditor auditor =
      WrongPlatformLocalizationAuditor();
  final DateTime requestDateTime = _buildTodayNoon();
  final AppDatabase database = AppDatabase.forTesting(NativeDatabase.memory());
  final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);
  await importer.importFromJsonString(
    await _readAssetFile(SubwayLineInfoImporter.defaultAssetPath),
    rawRouteCsv: await _readAssetFile(
      SubwayLineInfoImporter.defaultRouteAssetPath,
    ),
    rawBranchKeysCsv: await _readAssetFile(
      SubwayLineInfoImporter.defaultBranchKeysAssetPath,
    ),
    rawDirectionPoliciesCsv: await _readAssetFile(
      SubwayLineInfoImporter.defaultDirectionPoliciesAssetPath,
    ),
    rawStationTransitionOverridesCsv: await _readAssetFile(
      SubwayLineInfoImporter.defaultStationTransitionOverridesAssetPath,
    ),
  );

  stdout.writeln(
    'Running $label with ${testCases.length} cases at ${_formatDateTime(requestDateTime)}',
  );

  int successCount = 0;
  int parserFailureCount = 0;
  int apiFailureCount = 0;
  int exceptionCount = 0;

  try {
    for (final ApiRouteTestCase testCase in testCases) {
      stdout.writeln('');
      stdout.writeln('=== ${testCase.id} | ${testCase.start} -> ${testCase.end}');

      try {
        final RouteApiResponseDto response = await apiClient.fetchShortestPath(
          departureStation: testCase.start,
          arrivalStation: testCase.end,
          requestDateTime: requestDateTime,
        );

        final String resultCode = response.header?.resultCode ?? 'null';
        final String resultMessage = response.header?.resultMsg ?? 'null';
        final int rawPathCount = response.body?.paths?.length ?? 0;
        stdout.writeln(
          'API header: resultCode=$resultCode, resultMsg=$resultMessage, rawPathCount=$rawPathCount',
        );

        if (resultCode != '00') {
          apiFailureCount += 1;
          stdout.writeln('API status: FAILED');
          continue;
        }

        final ParsedRouteParseResult parsed = await parser.parseWithDatabase(
          response,
          database: database,
        );
        switch (parsed) {
          case ParsedRouteParseSuccess(:final route):
            successCount += 1;
            final String stationTrail = route.stationTrail.join(' -> ');
            stdout.writeln(
              'Parser status: SUCCESS | legs=${route.legs.length}, transfers=${route.transfers.length}, totalDurationSeconds=${route.totalDurationSeconds}',
            );
            stdout.writeln('Station trail: $stationTrail');

            for (int i = 0; i < route.legs.length; i++) {
              final RouteLeg leg = route.legs[i];
              stdout.writeln(
                'Leg ${i + 1}: ${leg.lineName} | direction=${leg.directionLabel} | next=${leg.nextStationName} | stations=${leg.stationNames.join(' -> ')}',
              );
            }

            for (int i = 0; i < route.transfers.length; i++) {
              final TransferSegment transfer = route.transfers[i];
              stdout.writeln(
                'Transfer ${i + 1}: ${transfer.stationName} | ${transfer.fromLineName} -> ${transfer.toLineName} | durationSeconds=${transfer.durationSeconds}',
              );
            }

            for (final AppLanguage language in AppLanguage.values) {
              final routeViewData = await mapper.mapWithDatabase(
                route,
                database: database,
                language: language,
              );
              final List<WrongPlatformLegLocalizationAudit> audit = auditor
                  .auditRoute(
                    route: route,
                    viewData: routeViewData,
                    language: language,
                  );
              stdout.writeln('RouteViewData JSON [${language.name}]:');
              stdout.writeln(
                const JsonEncoder.withIndent('  ').convert(routeViewData.toJson()),
              );
              stdout.writeln(
                'WrongPlatform audit [${language.name}]:',
              );
              stdout.writeln(
                const JsonEncoder.withIndent('  ').convert(
                  audit
                      .map(
                        (WrongPlatformLegLocalizationAudit item) => item.toJson(),
                      )
                      .toList(growable: false),
                ),
              );
            }
          case ParsedRouteParseFailure(:final code, :final message):
            parserFailureCount += 1;
            stdout.writeln(
              'Parser status: FAILED | code=${code.name} | message=${message ?? 'null'}',
            );
        }
      } catch (error) {
        exceptionCount += 1;
        stdout.writeln('Request exception: $error');
      }
    }
  } finally {
    await database.close();
  }

  stdout.writeln('');
  stdout.writeln('=== Summary');
  stdout.writeln('Successful parses: $successCount');
  stdout.writeln('Parser failures: $parserFailureCount');
  stdout.writeln('API failures: $apiFailureCount');
  stdout.writeln('Request exceptions: $exceptionCount');
}

Future<String> _readAssetFile(String relativePath) {
  return File(relativePath).readAsString();
}

Future<_RunnerConfig> _loadRunnerConfig() async {
  final Map<String, String> env = await _readDotEnv('.env.local');
  final String apiKey =
      env['SEOUL_ROUTE_API_KEY'] ?? Platform.environment['SEOUL_ROUTE_API_KEY'] ?? '';
  final String baseUrl =
      env['SEOUL_ROUTE_API_BASE_URL'] ??
      Platform.environment['SEOUL_ROUTE_API_BASE_URL'] ??
      'http://openapi.seoul.go.kr:8088';

  return _RunnerConfig(apiKey: apiKey, baseUrl: baseUrl);
}

Future<Map<String, String>> _readDotEnv(String path) async {
  final File file = File(path);
  if (!await file.exists()) {
    return <String, String>{};
  }

  final List<String> lines = await file.readAsLines();
  final Map<String, String> values = <String, String>{};
  for (final String line in lines) {
    final String trimmed = line.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#')) {
      continue;
    }
    final int separatorIndex = trimmed.indexOf('=');
    if (separatorIndex <= 0) {
      continue;
    }
    final String key = trimmed.substring(0, separatorIndex).trim();
    final String value = trimmed.substring(separatorIndex + 1).trim();
    values[key] = value;
  }
  return values;
}

DateTime _buildTodayNoon() {
  final DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day, 12);
}

String _formatDateTime(DateTime dateTime) {
  final String year = dateTime.year.toString().padLeft(4, '0');
  final String month = dateTime.month.toString().padLeft(2, '0');
  final String day = dateTime.day.toString().padLeft(2, '0');
  final String hour = dateTime.hour.toString().padLeft(2, '0');
  final String minute = dateTime.minute.toString().padLeft(2, '0');
  final String second = dateTime.second.toString().padLeft(2, '0');
  return '$year-$month-$day $hour:$minute:$second';
}

final Map<String, List<ApiRouteTestCase>> _phases = <String, List<ApiRouteTestCase>>{
  'phase1': <ApiRouteTestCase>[
    ApiRouteTestCase(id: 'TC01', start: '잠실', end: '건대입구'),
    ApiRouteTestCase(id: 'TC02', start: '신도림', end: '잠실'),
    ApiRouteTestCase(id: 'TC03', start: '잠실', end: '압구정'),
    ApiRouteTestCase(id: 'TC04', start: '건대입구', end: '공덕'),
  ],
  'phase2': <ApiRouteTestCase>[
    ApiRouteTestCase(id: 'TC05', start: '합정', end: '신논현'),
    ApiRouteTestCase(id: 'TC06', start: '홍대입구', end: '서울숲'),
    ApiRouteTestCase(id: 'TC07', start: '강남', end: '관악산'),
    ApiRouteTestCase(id: 'TC08', start: '교대', end: '광교'),
    ApiRouteTestCase(id: 'TC09', start: '강남', end: '김포공항'),
    ApiRouteTestCase(id: 'TC10', start: '김포공항', end: '관악산'),
    ApiRouteTestCase(id: 'TC11', start: '까치산', end: '잠실'),
  ],
  'phase3': <ApiRouteTestCase>[
    ApiRouteTestCase(id: 'TC12', start: '용두', end: '강남'),
    ApiRouteTestCase(id: 'TC13', start: '잠실', end: '잠실'),
    ApiRouteTestCase(id: 'TC14', start: '서울역', end: '선릉'),
    ApiRouteTestCase(id: 'TC15', start: '도림천', end: '건대입구'),
    ApiRouteTestCase(id: 'TC16', start: '홍대입구', end: '잠실나루'),
    ApiRouteTestCase(id: 'TC17', start: '홍대입구', end: '판교'),
    ApiRouteTestCase(id: 'TC18', start: '건대입구', end: '염창'),
    ApiRouteTestCase(id: 'TC19', start: '서울숲', end: '김포공항'),
    ApiRouteTestCase(id: 'TC20', start: '관악산', end: '개화'),
  ],
};

class ApiRouteTestCase {
  const ApiRouteTestCase({
    required this.id,
    required this.start,
    required this.end,
  });

  final String id;
  final String start;
  final String end;
}

class _RunnerConfig {
  const _RunnerConfig({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;
}
