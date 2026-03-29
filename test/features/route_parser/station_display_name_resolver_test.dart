import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/features/route_parser/domain/station_display_name_resolver.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main() {
  group('StationDisplayNameResolver', () {
    test('prefers station code lookup over raw name fallback', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

      final int stationId = await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '서울역',
              nameEn: const Value('Seoul Station'),
              nameJp: const Value('ソウル駅'),
              nameCh: const Value('首尔站'),
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
              stationId: stationId,
              stationCode: '0150',
              orderIndex: 1,
            ),
          );

      final StationDisplayNameLookup lookup =
          await StationDisplayNameLookup.load(database);
      const StationDisplayNameResolver resolver = StationDisplayNameResolver();

      final resolved = resolver.resolve(
        lookup: lookup,
        language: AppLanguage.zhHans,
        stationCode: '0150',
        rawStationName: '서울',
      );

      expect(resolved.primary, '首尔站');
      expect(resolved.secondary, 'Seoul Station');
      expect(resolved.fullText, '首尔站 (Seoul Station)');
    });

    test(
      'falls back to exact Korean name match when station code is missing',
      () async {
        final AppDatabase database = AppDatabase.forTesting(
          NativeDatabase.memory(),
        );
        addTearDown(database.close);

        await database
            .into(database.stations)
            .insert(
              StationsCompanion.insert(
                nameKo: '판교',
                nameEn: const Value('Pangyo'),
                nameJp: const Value('パンギョ'),
                nameCh: const Value('板桥'),
              ),
            );

        final StationDisplayNameLookup lookup =
            await StationDisplayNameLookup.load(database);
        const StationDisplayNameResolver resolver =
            StationDisplayNameResolver();

        final resolved = resolver.resolve(
          lookup: lookup,
          language: AppLanguage.ja,
          stationCode: null,
          rawStationName: '판교',
        );

        expect(resolved.primary, 'パンギョ');
        expect(resolved.secondary, 'Pangyo');
      },
    );

    test('falls back to raw station name when no DB match exists', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

      final StationDisplayNameLookup lookup =
          await StationDisplayNameLookup.load(database);
      const StationDisplayNameResolver resolver = StationDisplayNameResolver();

      final resolved = resolver.resolve(
        lookup: lookup,
        language: AppLanguage.en,
        stationCode: '9999',
        rawStationName: '임시역',
      );

      expect(resolved.primary, '임시역');
      expect(resolved.secondary, null);
      expect(resolved.fullText, '임시역');
    });
  });
}
