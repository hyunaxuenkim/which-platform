import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/features/route_parser/domain/station_display_name_formatter.dart';
import 'package:which_platform/features/settings/domain/app_language.dart';

void main() {
  const StationDisplayNameFormatter formatter = StationDisplayNameFormatter();

  group('StationDisplayNameFormatter', () {
    test('shows English only when English pack exists', () {
      expect(
        formatter.format(
          language: AppLanguage.en,
          rawStationName: '서울역',
          koreanName: '서울역',
          englishName: 'Seoul Station',
        ),
        'Seoul Station',
      );
    });

    test('falls back to Korean DB name before raw API name for English', () {
      expect(
        formatter.format(
          language: AppLanguage.en,
          rawStationName: '서울',
          koreanName: '서울역',
          englishName: ' ',
        ),
        '서울역',
      );
    });

    test('shows Chinese with English for Simplified Chinese', () {
      expect(
        formatter.format(
          language: AppLanguage.zhHans,
          rawStationName: '서울역',
          koreanName: '서울역',
          englishName: 'Seoul Station',
          chineseName: '首尔站',
        ),
        '首尔站 (Seoul Station)',
      );
    });

    test('shows Japanese with English for Japanese locale', () {
      expect(
        formatter.format(
          language: AppLanguage.ja,
          rawStationName: '서울역',
          koreanName: '서울역',
          englishName: 'Seoul Station',
          japaneseName: 'ソウル駅',
        ),
        'ソウル駅 (Seoul Station)',
      );
    });

    test(
      'falls back to English before Korean when localized name is missing',
      () {
        expect(
          formatter.format(
            language: AppLanguage.zhHans,
            rawStationName: '서울',
            koreanName: '서울역',
            englishName: 'Seoul Station',
          ),
          'Seoul Station',
        );
      },
    );

    test(
      'does not duplicate English subtitle when localized fallback resolves to English',
      () {
        final resolved = formatter.resolve(
          language: AppLanguage.zhHans,
          rawStationName: '서울',
          koreanName: '서울역',
          englishName: 'Seoul Station',
          chineseName: null,
        );

        expect(resolved.primary, 'Seoul Station');
        expect(resolved.secondary, isNull);
        expect(resolved.fullText, 'Seoul Station');
      },
    );

    test(
      'falls back to English only when localized, Korean, and raw names are missing',
      () {
        expect(
          formatter.format(
            language: AppLanguage.ja,
            rawStationName: null,
            koreanName: null,
            englishName: 'Seoul Station',
            japaneseName: null,
          ),
          'Seoul Station',
        );
      },
    );

    test(
      'falls back to English before Korean for Japanese when localized name is missing',
      () {
        expect(
          formatter.format(
            language: AppLanguage.ja,
            rawStationName: '판교',
            koreanName: '판교',
            englishName: 'Pangyo',
            japaneseName: null,
          ),
          'Pangyo',
        );
      },
    );

    test(
      'falls back to raw API Korean after localized, English, and DB Korean',
      () {
        expect(
          formatter.format(
            language: AppLanguage.zhHans,
            rawStationName: '서울',
            koreanName: null,
            englishName: null,
            chineseName: null,
          ),
          '서울',
        );
      },
    );

    test('resolves primary and secondary separately for CJK display', () {
      final resolved = formatter.resolve(
        language: AppLanguage.zhHans,
        rawStationName: '서울역',
        koreanName: '서울역',
        englishName: 'Seoul Station',
        chineseName: '首尔站',
      );

      expect(resolved.primary, '首尔站');
      expect(resolved.secondary, 'Seoul Station');
      expect(resolved.fullText, '首尔站 (Seoul Station)');
    });

    test('keeps asset text as-is for long localized station names', () {
      expect(
        formatter.format(
          language: AppLanguage.zhHans,
          rawStationName: '동대문역사문화공원',
          koreanName: '동대문역사문화공원',
          englishName: 'Dongdaemun History  Culture Park',
          chineseName: '东大门历史文化公园(DDP)',
        ),
        '东大门历史文化公园(DDP) (Dongdaemun History  Culture Park)',
      );
    });

    test(
      'uses localized pack only primary and keeps English as required subtitle',
      () {
        expect(
          formatter.format(
            language: AppLanguage.zhHans,
            rawStationName: null,
            koreanName: null,
            englishName: 'Seoul Station',
            chineseName: '首尔站',
          ),
          '首尔站 (Seoul Station)',
        );
      },
    );

    test('returns missing information when every candidate is empty', () {
      expect(
        formatter.format(
          language: AppLanguage.en,
          rawStationName: ' ',
          koreanName: null,
          englishName: '',
        ),
        StationDisplayNameFormatter.missingInformationText,
      );
    });

    test('trims whitespace around primary and secondary names', () {
      final resolved = formatter.resolve(
        language: AppLanguage.ja,
        rawStationName: ' 서울역 ',
        koreanName: ' 서울역 ',
        englishName: ' Seoul Station ',
        japaneseName: ' ソウル駅 ',
      );

      expect(resolved.primary, 'ソウル駅');
      expect(resolved.secondary, 'Seoul Station');
      expect(resolved.fullText, 'ソウル駅 (Seoul Station)');
    });
  });
}
