import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:which_platform/app/app.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/database_provider.dart';
import 'package:which_platform/features/route/presentation/route_page.dart';
import 'package:which_platform/features/route_parser/data/seoul_route_api_client.dart';
import 'package:which_platform/features/route_parser/domain/route_api_response_dto.dart';
import 'package:which_platform/features/route_parser/providers/route_parser_providers.dart';
import 'package:which_platform/features/search/presentation/search_route_params.dart';
import 'package:which_platform/features/settings/data/app_language_storage.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';
import 'package:which_platform/features/settings/providers/app_language_providers.dart';

class _InMemoryAppLanguageStorage implements AppLanguageStorage {
  _InMemoryAppLanguageStorage({this.savedLanguage});

  AppLanguage? savedLanguage;

  @override
  Future<AppLanguage?> load() async => savedLanguage;

  @override
  Future<void> save(AppLanguage language) async {
    savedLanguage = language;
  }
}

class _RecordingRouteApiClient extends SeoulRouteApiClient {
  String? departureStation;
  String? arrivalStation;

  @override
  Future<RouteApiResponseDto> fetchShortestPath({
    required String departureStation,
    required String arrivalStation,
    required DateTime requestDateTime,
  }) async {
    this.departureStation = departureStation;
    this.arrivalStation = arrivalStation;
    return const RouteApiResponseDto(
      header: RouteApiHeaderDto(resultCode: '99', resultMsg: 'No route'),
    );
  }
}

ProviderScope _buildTestApp({
  required AppDatabase database,
  AppLanguage initialLanguage = AppLanguage.en,
  AppLanguageStorage? storage,
  SeoulRouteApiClient? routeApiClient,
}) {
  return ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      initialAppLanguageProvider.overrideWithValue(initialLanguage),
      appLanguageStorageProvider.overrideWithValue(
        storage ?? _InMemoryAppLanguageStorage(savedLanguage: initialLanguage),
      ),
      if (routeApiClient != null)
        seoulRouteApiClientProvider.overrideWithValue(routeApiClient),
    ],
    child: const WhichPlatformApp(),
  );
}

ProviderScope _buildRouteTestApp({
  required AppDatabase database,
  required SearchRouteParams params,
  required AppLanguage language,
  required SeoulRouteApiClient routeApiClient,
}) {
  return ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      initialAppLanguageProvider.overrideWithValue(language),
      appLanguageStorageProvider.overrideWithValue(
        _InMemoryAppLanguageStorage(savedLanguage: language),
      ),
      seoulRouteApiClientProvider.overrideWithValue(routeApiClient),
    ],
    child: MaterialApp(home: RoutePage(params: params)),
  );
}

void main() {
  testWidgets('shows search screen as the first route', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    expect(find.text('Wayfinder'), findsOneWidget);
    expect(find.text('Where to?'), findsOneWidget);
    expect(find.text('GO'), findsOneWidget);
    expect(find.text('Seoul Station'), findsOneWidget);
    expect(find.text('Origin station'), findsOneWidget);
    expect(find.text('Destination or place'), findsOneWidget);
    expect(
      tester
          .widget<TextField>(
            find.byKey(const ValueKey<String>('journey-field-Seoul Station')),
          )
          .controller!
          .text,
      isEmpty,
    );

    await database.close();
  });

  testWidgets('opens the shared settings sheet from the search screen', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsWidgets);
    expect(find.text('Close'), findsOneWidget);

    await database.close();
  });

  testWidgets('keeps the stations-required error for empty search input', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey<String>('search-go-button')));
    await tester.pumpAndSettle();

    expect(find.text('Stations required'), findsOneWidget);
    expect(
      find.text('Enter both departure and arrival stations.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    await database.close();
  });

  testWidgets('updates visible strings when the app language changes', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final storage = _InMemoryAppLanguageStorage();

    await tester.pumpWidget(
      _buildTestApp(database: database, storage: storage),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simplified Chinese').last);
    await tester.pumpAndSettle();

    expect(find.text('设置'), findsOneWidget);
    expect(find.text('关闭'), findsOneWidget);
    expect(find.text('Japanese'), findsNothing);
    expect(find.text('日本語'), findsOneWidget);
    expect(storage.savedLanguage, AppLanguage.zhHans);

    await tester.tap(find.text('关闭'));
    await tester.pumpAndSettle();

    expect(find.text('去哪里？'), findsOneWidget);
    expect(find.text('出发'), findsOneWidget);
    expect(find.text('首尔站'), findsOneWidget);
    expect(find.text('出发站'), findsOneWidget);
    expect(find.text('到达站或目的地'), findsOneWidget);
    expect(find.text('导航'), findsOneWidget);
    expect(find.text('WAYFINDER'), findsNothing);

    await database.close();
  });

  testWidgets(
    'keeps typed input and switches suggestions when language changes',
    (WidgetTester tester) async {
      final database = AppDatabase.forTesting(NativeDatabase.memory());
      final storage = _InMemoryAppLanguageStorage(
        savedLanguage: AppLanguage.en,
      );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '서울역',
              nameEn: const Value('Seoul Station'),
              nameJp: const Value('ソウル駅'),
              nameCh: const Value('首尔站'),
            ),
          );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '시청',
              nameEn: const Value('City Hall'),
              nameJp: const Value('シチョン'),
              nameCh: const Value('市厅'),
            ),
          );

      await tester.pumpWidget(
        _buildTestApp(database: database, storage: storage),
      );
      await tester.pumpAndSettle();

      final Finder originField = find.byType(TextField).at(0);
      await tester.enterText(originField, 'Seoul Station');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Simplified Chinese').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('关闭'));
      await tester.pumpAndSettle();

      expect(
        tester.widget<TextField>(originField).controller!.text,
        'Seoul Station',
      );

      final Finder destinationField = find.byType(TextField).at(1);
      await tester.tap(destinationField);
      await tester.pump();
      await tester.enterText(destinationField, '市');
      await tester.pumpAndSettle();

      expect(find.text('市厅'), findsOneWidget);

      await database.close();
    },
  );

  testWidgets('shows autocomplete suggestions and applies the selection', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    await database
        .into(database.stations)
        .insert(
          StationsCompanion.insert(
            nameKo: '서울역',
            nameEn: const Value('Seoul Station'),
            nameJp: const Value('ソウル駅'),
            nameCh: const Value('首尔站'),
          ),
        );
    await database
        .into(database.stations)
        .insert(
          StationsCompanion.insert(
            nameKo: '시청',
            nameEn: const Value('City Hall'),
            nameJp: const Value('シチョン'),
            nameCh: const Value('市厅'),
          ),
        );

    await tester.pumpWidget(_buildTestApp(database: database));
    await tester.pumpAndSettle();

    final Finder originField = find.byKey(
      const ValueKey<String>('journey-field-Seoul Station'),
    );

    await tester.tap(originField);
    await tester.pump();
    await tester.enterText(originField, 'S');
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey<String>('station-suggestion-list')),
      findsOneWidget,
    );
    expect(find.text('Seoul Station'), findsWidgets);

    await tester.tap(find.text('Seoul Station').last);
    await tester.pumpAndSettle();

    expect(
      tester.widget<TextField>(originField).controller!.text,
      'Seoul Station',
    );
    expect(
      find.byKey(const ValueKey<String>('station-suggestion-list')),
      findsNothing,
    );

    await database.close();
  });

  testWidgets('normalizes localized suggestions before requesting a route', (
    WidgetTester tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    final routeApiClient = _RecordingRouteApiClient();
    final int originStationId = await database
        .into(database.stations)
        .insert(
          StationsCompanion.insert(
            nameKo: '서울역',
            nameEn: const Value('Seoul Station'),
            nameJp: const Value('ソウル駅'),
            nameCh: const Value('首尔站'),
          ),
        );
    final int destinationStationId = await database
        .into(database.stations)
        .insert(
          StationsCompanion.insert(
            nameKo: '시청',
            nameEn: const Value('City Hall'),
            nameJp: const Value('シチョン'),
            nameCh: const Value('市厅'),
          ),
        );
    final int lineId = await database
        .into(database.lines)
        .insert(LinesCompanion.insert(name: '01호선'));
    await database
        .into(database.lineStations)
        .insert(
          LineStationsCompanion.insert(
            lineId: lineId,
            stationId: originStationId,
            stationCode: '0150',
            orderIndex: 1,
          ),
        );
    await database
        .into(database.lineStations)
        .insert(
          LineStationsCompanion.insert(
            lineId: lineId,
            stationId: destinationStationId,
            stationCode: '0151',
            orderIndex: 2,
          ),
        );
    await database
        .into(database.directionPolicies)
        .insert(
          DirectionPoliciesCompanion.insert(
            lineId: lineId,
            directionKind: 'UP',
            displayLabelKo: '상행',
          ),
        );
    await database
        .into(database.stationTransitionOverrides)
        .insert(
          StationTransitionOverridesCompanion.insert(
            lineId: lineId,
            currentStationCode: '0150',
            nextStationCode: '0151',
            resolvedBranchKey: 'MAIN',
          ),
        );

    await tester.pumpWidget(
      _buildRouteTestApp(
        database: database,
        language: AppLanguage.zhHans,
        routeApiClient: routeApiClient,
        params: const SearchRouteParams(
          origin: '首尔站',
          destination: '市厅',
          voiceGuidanceEnabled: false,
        ),
      ),
    );

    await tester.pump();
    await tester.runAsync(() async {
      for (int retry = 0; retry < 50; retry++) {
        if (routeApiClient.departureStation != null) {
          return;
        }
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }
    });
    await tester.pump();

    expect(routeApiClient.departureStation, '서울역');
    expect(routeApiClient.arrivalStation, '시청');
    expect(find.text('无法提供路线'), findsOneWidget);

    await database.close();
  });
}
