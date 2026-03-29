import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/features/search/domain/station_search_lookup.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main() {
  group('StationSearchLookup', () {
    test('normalizes multilingual aliases to canonical Korean names', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

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

      final StationSearchLookup lookup = await StationSearchLookup.load(
        database,
      );

      expect(
        lookup.normalizeToCanonicalKorean(
          'Seoul Station',
          preferredLanguage: AppLanguage.en,
        ),
        '서울역',
      );
      expect(
        lookup.normalizeToCanonicalKorean(
          '首尔站',
          preferredLanguage: AppLanguage.zhHans,
        ),
        '서울역',
      );
      expect(
        lookup.normalizeToCanonicalKorean(
          'ソウル駅',
          preferredLanguage: AppLanguage.ja,
        ),
        '서울역',
      );
      expect(
        lookup.normalizeToCanonicalKorean(
          ' 서울역 ',
          preferredLanguage: AppLanguage.en,
        ),
        '서울역',
      );
    });

    test('prefers aliases that match the current UI language first', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '영어우선역',
              nameEn: const Value('Shared Alias'),
            ),
          );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '일본어우선역',
              nameJp: const Value('Shared Alias'),
            ),
          );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '중국어우선역',
              nameCh: const Value('Shared Alias'),
            ),
          );

      final StationSearchLookup lookup = await StationSearchLookup.load(
        database,
      );

      expect(
        lookup.normalizeToCanonicalKorean(
          'Shared Alias',
          preferredLanguage: AppLanguage.en,
        ),
        '영어우선역',
      );
      expect(
        lookup.normalizeToCanonicalKorean(
          'Shared Alias',
          preferredLanguage: AppLanguage.ja,
        ),
        '일본어우선역',
      );
      expect(
        lookup.normalizeToCanonicalKorean(
          'Shared Alias',
          preferredLanguage: AppLanguage.zhHans,
        ),
        '중국어우선역',
      );
    });

    test(
      'passes through trimmed raw input when no exact alias exists',
      () async {
        final AppDatabase database = AppDatabase.forTesting(
          NativeDatabase.memory(),
        );
        addTearDown(database.close);

        final StationSearchLookup lookup = await StationSearchLookup.load(
          database,
        );

        expect(
          lookup.normalizeToCanonicalKorean(
            '  Unknown Place  ',
            preferredLanguage: AppLanguage.en,
          ),
          'Unknown Place',
        );
      },
    );
  });
}
