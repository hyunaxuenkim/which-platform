import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../../../core/database/import/subway_line_info_importer.dart';
import '../../route_parser/data/seoul_route_api_client.dart';
import '../../route_parser/domain/parsed_route_models.dart';
import '../../route_parser/domain/route_api_response_dto.dart';
import '../../route_parser/domain/route_response_parser.dart';
import '../../route_parser/domain/route_view_data.dart';
import '../../route_parser/domain/route_view_data_mapper.dart';
import '../../route_parser/providers/route_parser_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final RouteResponseParser _routeResponseParser = const RouteResponseParser();
  late final TextEditingController _departureController;
  late final TextEditingController _arrivalController;
  bool _isImporting = false;
  String? _errorMessage;
  SubwayLineInfoImportResult? _importResult;
  _DatabaseDebugSnapshot? _snapshot;
  bool _isFetchingLiveRoute = false;
  String? _liveRouteErrorMessage;
  RouteViewData? _liveRouteViewData;
  String? _liveRouteViewDataJson;
  String? _liveRouteRequestSummary;
  String? _liveRouteDiagnostics;

  @override
  void initState() {
    super.initState();
    _departureController = TextEditingController(text: '서울역');
    _arrivalController = TextEditingController(text: '잠실');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshSnapshot();
    });
  }

  @override
  void dispose() {
    _departureController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  Future<void> _fetchLiveRouteViewData() async {
    final String departureStation = _departureController.text.trim();
    final String arrivalStation = _arrivalController.text.trim();
    if (departureStation.isEmpty || arrivalStation.isEmpty) {
      setState(() {
        _liveRouteErrorMessage =
            'Please enter both departure and arrival stations.';
        _liveRouteViewData = null;
        _liveRouteViewDataJson = null;
        _liveRouteRequestSummary = null;
        _liveRouteDiagnostics = null;
      });
      return;
    }

    setState(() {
      _isFetchingLiveRoute = true;
      _liveRouteErrorMessage = null;
      _liveRouteViewData = null;
      _liveRouteViewDataJson = null;
      _liveRouteRequestSummary = null;
      _liveRouteDiagnostics = null;
    });

    final DateTime requestDateTime = _buildTodayNoon();

    try {
      final SeoulRouteApiClient apiClient = ref.read(
        seoulRouteApiClientProvider,
      );
      final RouteApiResponseDto response = await apiClient.fetchShortestPath(
        departureStation: departureStation,
        arrivalStation: arrivalStation,
        requestDateTime: requestDateTime,
      );

      final String? resultCode = response.header?.resultCode;
      final String? resultMessage = response.header?.resultMsg;
      final int? rawPathCount = response.body?.paths?.length;
      final bool hasBody = response.body != null;
      _liveRouteDiagnostics = _buildRouteDiagnostics(
        resultCode: resultCode,
        resultMessage: resultMessage,
        hasBody: hasBody,
        rawPathCount: rawPathCount,
        requestDateTime: requestDateTime,
      );

      if (resultCode != null && resultCode != '00') {
        setState(() {
          _liveRouteErrorMessage =
              'API error [$resultCode] ${resultMessage ?? 'Unknown error'}';
          _liveRouteRequestSummary =
              '$departureStation → $arrivalStation (${_formatDateTimeForDisplay(requestDateTime)})';
        });
        return;
      }

      final database = ref.read(appDatabaseProvider);
      final result = await _routeResponseParser.parseWithDatabase(
        response,
        database: database,
      );
      final Map<String, String> lineColorHexByName = await database
          .getLineColorHexByName();
      final RouteViewDataMapper routeViewDataMapper = RouteViewDataMapper(
        lineColorHexByName: lineColorHexByName,
      );

      await result.when(
        success: (ParsedRoute route) async {
          final routeViewData = await routeViewDataMapper.mapWithDatabase(
            route,
            database: database,
          );
          _liveRouteViewData = routeViewData;
          _liveRouteViewDataJson = const JsonEncoder.withIndent(
            '  ',
          ).convert(routeViewData.toJson());
          _liveRouteRequestSummary =
              '$departureStation → $arrivalStation (${_formatDateTimeForDisplay(requestDateTime)})';
        },
        failure: (ParseFailureCode code, String? message) {
          _liveRouteErrorMessage =
              'Parse failed: ${code.name}${message == null ? '' : ' / $message'}';
          if (code == ParseFailureCode.emptyPaths) {
            _liveRouteErrorMessage =
                'Parse failed: emptyPaths / API returned successfully, but body.paths is empty.';
          }
        },
      );
    } catch (error) {
      _liveRouteErrorMessage = error.toString();
    } finally {
      if (mounted) {
        setState(() {
          _isFetchingLiveRoute = false;
        });
      }
    }
  }

  Future<void> _runLineInfoImport() async {
    setState(() {
      _isImporting = true;
      _errorMessage = null;
    });

    try {
      final importer = ref.read(subwayLineInfoImporterProvider);
      final result = await importer.importFromAsset();
      final snapshot = await _loadSnapshot();

      setState(() {
        _importResult = result;
        _snapshot = snapshot;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isImporting = false;
        });
      }
    }
  }

  Future<void> _refreshSnapshot() async {
    setState(() {
      _errorMessage = null;
    });

    try {
      final snapshot = await _loadSnapshot();
      if (mounted) {
        setState(() {
          _snapshot = snapshot;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _errorMessage = error.toString();
        });
      }
    }
  }

  Future<_DatabaseDebugSnapshot> _loadSnapshot() async {
    final database = ref.read(appDatabaseProvider);
    final lines = await database.select(database.lines).get();
    final stations = await database.select(database.stations).get();
    final lineStations = await database.select(database.lineStations).get();
    final directionPolicies = await database
        .select(database.directionPolicies)
        .get();
    final stationTransitionOverrides = await database
        .select(database.stationTransitionOverrides)
        .get();

    return _DatabaseDebugSnapshot(
      lineCount: lines.length,
      stationCount: stations.length,
      lineStationCount: lineStations.length,
      directionPolicyCount: directionPolicies.length,
      stationTransitionOverrideCount: stationTransitionOverrides.length,
      firstLineJson: lines.isEmpty
          ? null
          : _toPrettyJson(<String, Object?>{
              'id': lines.first.id,
              'name': lines.first.name,
              'color': lines.first.color,
              'lineType': lines.first.lineType,
            }),
      firstStationJson: stations.isEmpty
          ? null
          : _toPrettyJson(<String, Object?>{
              'id': stations.first.id,
              'nameKo': stations.first.nameKo,
              'nameEn': stations.first.nameEn,
              'nameJp': stations.first.nameJp,
              'nameCh': stations.first.nameCh,
            }),
    );
  }

  String _toPrettyJson(Map<String, Object?> json) {
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  String _formatDateTimeForDisplay(DateTime dateTime) {
    final String year = dateTime.year.toString().padLeft(4, '0');
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String hour = dateTime.hour.toString().padLeft(2, '0');
    final String minute = dateTime.minute.toString().padLeft(2, '0');
    final String second = dateTime.second.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute:$second';
  }

  DateTime _buildTodayNoon() {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 12);
  }

  String _buildRouteDiagnostics({
    required String? resultCode,
    required String? resultMessage,
    required bool hasBody,
    required int? rawPathCount,
    required DateTime requestDateTime,
  }) {
    return const JsonEncoder.withIndent('  ').convert(<String, Object?>{
      'requestDateTime': _formatDateTimeForDisplay(requestDateTime),
      'resultCode': resultCode,
      'resultMsg': resultMessage,
      'hasBody': hasBody,
      'rawPathCount': rawPathCount,
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('서울 지하철 경로 안내'), centerTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            '디버그용 DB Import 화면',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'subway_line_info.json import를 실행하고 실제 DB row 수와 [0] 데이터를 확인할 수 있습니다.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 24),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Import Actions',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: _isImporting ? null : _runLineInfoImport,
                      child: Text(
                        _isImporting ? 'Importing...' : 'Import Line Info',
                      ),
                    ),
                    OutlinedButton(
                      onPressed: _isImporting ? null : _refreshSnapshot,
                      child: const Text('Refresh Snapshot'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Assets: assets/data/subway_line_info.json, assets/data/full_route_info.csv',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _errorMessage!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Live API RouteViewData',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '출발역과 도착역을 입력하면 서울시 API를 실제로 호출하고 RouteViewData JSON 전체를 출력합니다. 호출 시각은 항상 당일 12:00:00으로 고정됩니다.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _departureController,
                  decoration: const InputDecoration(
                    labelText: '출발역',
                    hintText: '예: 서울역',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _arrivalController,
                  decoration: const InputDecoration(
                    labelText: '도착역',
                    hintText: '예: 잠실',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _isFetchingLiveRoute
                      ? null
                      : _fetchLiveRouteViewData,
                  child: Text(
                    _isFetchingLiveRoute
                        ? 'Fetching Live Route...'
                        : 'Fetch Live RouteViewData',
                  ),
                ),
                if (_liveRouteRequestSummary != null) ...[
                  const SizedBox(height: 12),
                  Text(_liveRouteRequestSummary!),
                ],
                if (_liveRouteErrorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _liveRouteErrorMessage!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
                if (_liveRouteDiagnostics != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Response Diagnostics',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _liveRouteDiagnostics),
                ],
                if (_liveRouteViewData != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    'RouteViewData Preview',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _RouteViewDataPreview(data: _liveRouteViewData!),
                ],
                if (_liveRouteViewDataJson != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    'RouteViewData',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _liveRouteViewDataJson),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Import Result',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                if (_importResult == null)
                  const Text('아직 import를 실행하지 않았습니다.')
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('processedRows: ${_importResult!.processedRows}'),
                      Text('insertedLines: ${_importResult!.insertedLines}'),
                      Text(
                        'insertedStations: ${_importResult!.insertedStations}',
                      ),
                      Text(
                        'insertedLineStations: ${_importResult!.insertedLineStations}',
                      ),
                      Text(
                        'updatedStations: ${_importResult!.updatedStations}',
                      ),
                      Text('skippedRows: ${_importResult!.skippedRows}'),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DB Snapshot',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                if (_snapshot == null)
                  const Text('DB snapshot을 불러오는 중입니다.')
                else ...[
                  Text('lines: ${_snapshot!.lineCount}'),
                  Text('stations: ${_snapshot!.stationCount}'),
                  Text('lineStations: ${_snapshot!.lineStationCount}'),
                  Text('directionPolicies: ${_snapshot!.directionPolicyCount}'),
                  Text(
                    'stationTransitionOverrides: ${_snapshot!.stationTransitionOverrideCount}',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'lines[0]',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _snapshot!.firstLineJson),
                  const SizedBox(height: 16),
                  Text(
                    'stations[0]',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _JsonPreview(text: _snapshot!.firstStationJson),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DatabaseDebugSnapshot {
  const _DatabaseDebugSnapshot({
    required this.lineCount,
    required this.stationCount,
    required this.lineStationCount,
    required this.directionPolicyCount,
    required this.stationTransitionOverrideCount,
    required this.firstLineJson,
    required this.firstStationJson,
  });

  final int lineCount;
  final int stationCount;
  final int lineStationCount;
  final int directionPolicyCount;
  final int stationTransitionOverrideCount;
  final String? firstLineJson;
  final String? firstStationJson;
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class _JsonPreview extends StatelessWidget {
  const _JsonPreview({required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const Text('데이터 없음');
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SelectableText(
        text!,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
      ),
    );
  }
}

class _RouteViewDataPreview extends StatelessWidget {
  const _RouteViewDataPreview({required this.data});

  final RouteViewData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${data.summary.departureStationName} → ${data.summary.arrivalStationName}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${data.summary.totalDurationText} · ${data.summary.totalFareText} · ${data.summary.transferCountText}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF4B5563),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...data.legItems.map((leg) => _RouteLegCard(item: leg)),
        if (data.transferItems.isNotEmpty) ...[
          const SizedBox(height: 12),
          ...data.transferItems.map((transfer) => _RouteTransferCard(item: transfer)),
        ],
      ],
    );
  }
}

class _RouteLegCard extends StatelessWidget {
  const _RouteLegCard({required this.item});

  final RouteLegItemViewData item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color backgroundColor = _parseHexColor(item.lineColorHex);
    final Brightness brightness =
        ThemeData.estimateBrightnessForColor(backgroundColor);
    final Color foregroundColor =
        brightness == Brightness.dark ? Colors.white : const Color(0xFF111827);
    final Color secondaryColor =
        brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.84)
            : const Color(0xFF374151);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.lineName,
            style: theme.textTheme.titleMedium?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${item.fromStationName} → ${item.toStationName}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.directionLabel,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '다음 역: ${item.nextStationName}',
            style: theme.textTheme.bodyMedium?.copyWith(color: secondaryColor),
          ),
          Text(
            '반대편 역: ${item.nextNegativeStationName}',
            style: theme.textTheme.bodyMedium?.copyWith(color: secondaryColor),
          ),
          Text(
            '반대 예시: ${item.directionNegativeExamplesText}',
            style: theme.textTheme.bodyMedium?.copyWith(color: secondaryColor),
          ),
          const SizedBox(height: 8),
          Text(
            '${item.stationCountText} · ${item.durationText}',
            style: theme.textTheme.bodyMedium?.copyWith(color: secondaryColor),
          ),
          const SizedBox(height: 6),
          Text(
            item.stationTrailText,
            style: theme.textTheme.bodySmall?.copyWith(color: secondaryColor),
          ),
        ],
      ),
    );
  }
}

class _RouteTransferCard extends StatelessWidget {
  const _RouteTransferCard({required this.item});

  final RouteTransferItemViewData item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '${item.stationName} 환승 · ${item.fromLineName} → ${item.toLineName} · ${item.walkingTimeText}',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF374151),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

Color _parseHexColor(String rawHex) {
  final String normalized = rawHex.trim().replaceFirst('#', '');
  if (normalized.length != 6) {
    return const Color(0xFF9E9E9E);
  }
  final int? value = int.tryParse('FF$normalized', radix: 16);
  if (value == null) {
    return const Color(0xFF9E9E9E);
  }
  return Color(value);
}
