import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';
import 'package:which_platform/features/route_parser/data/sample_route_response.dart';
import 'package:which_platform/features/route_parser/domain/parsed_route_models.dart';
import 'package:which_platform/features/route_parser/domain/route_response_parser.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data.dart';
import 'package:which_platform/features/route_parser/domain/route_view_data_mapper.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';
import 'package:which_platform/features/settings/domain/app_strings.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('builds locale-aware route copy from parsed route data', () async {
    final AppDatabase database = AppDatabase.forTesting(
      NativeDatabase.memory(),
    );
    addTearDown(database.close);

    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);
    await importer.importFromAsset();

    final RouteResponseParser parser = const RouteResponseParser();
    final ParsedRouteParseResult parseResult = await parser.parseWithDatabase(
      sampleRouteResponse,
      database: database,
    );
    final ParsedRoute route = parseResult.when(
      success: (route) => route,
      failure: (code, message) =>
          throw StateError('Expected parsed route, got $code: $message'),
    );

    final RouteViewData enViewData = await RouteViewDataMapper(
      lineColorHexByName: await database.getLineColorHexByName(),
    ).mapWithDatabase(route, database: database, language: AppLanguage.en);
    final RouteViewData zhViewData = await RouteViewDataMapper(
      lineColorHexByName: await database.getLineColorHexByName(),
    ).mapWithDatabase(route, database: database, language: AppLanguage.zhHans);

    final AppStrings en = AppStrings.forLanguage(AppLanguage.en);
    final AppStrings zh = AppStrings.forLanguage(AppLanguage.zhHans);

    expect(en.displayLabel(en.routeTravelTimeLabel), 'TRAVEL TIME');
    expect(zh.routeTravelTimeLabel, '总用时');

    expect(
      en.routeSummaryDescription(
        enViewData.summary.departureStation.fullText,
        enViewData.summary.arrivalStation.fullText,
      ),
      'From Seoul Station to Sangwangsimni',
    );
    expect(
      zh.routeSummaryDescription(
        zhViewData.summary.departureStation.fullText,
        zhViewData.summary.arrivalStation.fullText,
      ),
      '从首尔 (Seoul Station)前往上往十里 (Sangwangsimni)',
    );

    expect(
      en.formatDuration(enViewData.summary.totalDurationSeconds),
      '30m 30s',
    );
    expect(
      zh.formatDuration(zhViewData.summary.totalDurationSeconds),
      '30分30秒',
    );
    expect(
      en.formatTransferCount(enViewData.summary.transferCount),
      '1 transfer',
    );
    expect(zh.formatTransferCount(zhViewData.summary.transferCount), '换乘1次');

    expect(
      en.routeTransferTitle(enViewData.transferItems.single.station.fullText),
      'Transfer: Dongdaemun History  Culture Park',
    );
    expect(
      zh.routeTransferTitle(zhViewData.transferItems.single.station.fullText),
      '在东大门历史文化公园(DDP) (Dongdaemun History  Culture Park)换乘',
    );

    expect(en.displayLabel(en.routeCorrectPlatformTitle), 'CORRECT PLATFORM');
    expect(zh.routeCorrectPlatformTitle, '正确站台');
    expect(
      zh.formatDuration(zhViewData.transferItems.single.walkingTimeSeconds),
      '43秒',
    );
    expect(zh.formatStationCount(zhViewData.legItems.first.stationCount), '5站');
    expect(zhViewData.legItems.first.fromStation.secondary, 'Seoul Station');
    expect(
      zhViewData.legItems.first.nextStation.fullText,
      '会贤(南大门市场) (Hoehyeon)',
    );
  });
}
