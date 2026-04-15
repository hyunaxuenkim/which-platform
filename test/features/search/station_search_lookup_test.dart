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

    test('returns localized suggestions from a one-character query', () async {
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

      final StationSearchLookup lookup = await StationSearchLookup.load(
        database,
      );

      expect(
        lookup
            .filterSuggestions('首', preferredLanguage: AppLanguage.zhHans)
            .map((StationSearchSuggestion item) => item.displayText),
        <String>['首尔站'],
      );
      expect(
        lookup
            .filterSuggestions('ソ', preferredLanguage: AppLanguage.ja)
            .map((StationSearchSuggestion item) => item.displayText),
        <String>['ソウル駅'],
      );
      expect(
        lookup
            .filterSuggestions('S', preferredLanguage: AppLanguage.en)
            .map((StationSearchSuggestion item) => item.displayText),
        <String>['Seoul Station'],
      );
    });

    test('orders prefix matches before contains matches', () async {
      final AppDatabase database = AppDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);

      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '부전',
              nameEn: const Value('Bujeon'),
            ),
          );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '남부터미널',
              nameEn: const Value('Nambu Bus Terminal'),
            ),
          );

      final StationSearchLookup lookup = await StationSearchLookup.load(
        database,
      );

      expect(
        lookup
            .filterSuggestions('bu', preferredLanguage: AppLanguage.en)
            .map((StationSearchSuggestion item) => item.displayText),
        <String>['Bujeon', 'Nambu Bus Terminal'],
      );
    });

    test('deduplicates suggestions by canonical Korean name', () async {
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
            ),
          );
      await database
          .into(database.stations)
          .insert(
            StationsCompanion.insert(
              nameKo: '서울역',
              nameEn: const Value('Seoul'),
            ),
          );

      final StationSearchLookup lookup = await StationSearchLookup.load(
        database,
      );

      expect(
        lookup
            .filterSuggestions('Seo', preferredLanguage: AppLanguage.en)
            .map((StationSearchSuggestion item) => item.canonicalKoreanName),
        <String>['서울역'],
      );
    });

    test(
      'prefers aliases that match the current UI language for filtering',
      () async {
        final AppDatabase database = AppDatabase.forTesting(
          NativeDatabase.memory(),
        );
        addTearDown(database.close);

        await database
            .into(database.stations)
            .insert(
              StationsCompanion.insert(
                nameKo: '영어우선역',
                nameEn: const Value('Shared Prefix'),
              ),
            );
        await database
            .into(database.stations)
            .insert(
              StationsCompanion.insert(
                nameKo: '일본어우선역',
                nameJp: const Value('Shared Prefix'),
              ),
            );
        await database
            .into(database.stations)
            .insert(
              StationsCompanion.insert(
                nameKo: '중국어우선역',
                nameCh: const Value('Shared Prefix'),
              ),
            );

        final StationSearchLookup lookup = await StationSearchLookup.load(
          database,
        );

        expect(
          lookup
              .filterSuggestions('shared', preferredLanguage: AppLanguage.en)
              .first
              .canonicalKoreanName,
          '영어우선역',
        );
        expect(
          lookup
              .filterSuggestions('shared', preferredLanguage: AppLanguage.ja)
              .first
              .canonicalKoreanName,
          '일본어우선역',
        );
        expect(
          lookup
              .filterSuggestions(
                'shared',
                preferredLanguage: AppLanguage.zhHans,
              )
              .first
              .canonicalKoreanName,
          '중국어우선역',
        );
      },
    );
  });
}
