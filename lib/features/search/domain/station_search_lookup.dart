import '../../../core/database/app_database.dart';
import '../../settings/domain/app_language.dart';

class StationSearchLookup {
  StationSearchLookup({
    required this.canonicalByKoreanAlias,
    required this.canonicalByEnglishAlias,
    required this.canonicalByJapaneseAlias,
    required this.canonicalByChineseAlias,
  });

  static Future<StationSearchLookup> load(AppDatabase database) async {
    final List<Station> stations = await database
        .select(database.stations)
        .get();
    final Map<String, String> canonicalByKoreanAlias = <String, String>{};
    final Map<String, String> canonicalByEnglishAlias = <String, String>{};
    final Map<String, String> canonicalByJapaneseAlias = <String, String>{};
    final Map<String, String> canonicalByChineseAlias = <String, String>{};

    for (final Station station in stations) {
      final String canonicalKoreanName = station.nameKo.trim();
      if (canonicalKoreanName.isEmpty) {
        continue;
      }

      _putAlias(
        canonicalByKoreanAlias,
        alias: station.nameKo,
        canonicalKoreanName: canonicalKoreanName,
      );
      _putAlias(
        canonicalByEnglishAlias,
        alias: station.nameEn,
        canonicalKoreanName: canonicalKoreanName,
      );
      _putAlias(
        canonicalByJapaneseAlias,
        alias: station.nameJp,
        canonicalKoreanName: canonicalKoreanName,
      );
      _putAlias(
        canonicalByChineseAlias,
        alias: station.nameCh,
        canonicalKoreanName: canonicalKoreanName,
      );
    }

    return StationSearchLookup(
      canonicalByKoreanAlias: canonicalByKoreanAlias,
      canonicalByEnglishAlias: canonicalByEnglishAlias,
      canonicalByJapaneseAlias: canonicalByJapaneseAlias,
      canonicalByChineseAlias: canonicalByChineseAlias,
    );
  }

  final Map<String, String> canonicalByKoreanAlias;
  final Map<String, String> canonicalByEnglishAlias;
  final Map<String, String> canonicalByJapaneseAlias;
  final Map<String, String> canonicalByChineseAlias;

  String normalizeToCanonicalKorean(
    String input, {
    required AppLanguage preferredLanguage,
  }) {
    final String trimmed = input.trim();
    final String? normalized = _normalize(input);
    if (normalized == null) {
      return trimmed;
    }

    for (final Map<String, String> aliasMap in _mapsFor(preferredLanguage)) {
      final String? canonical = aliasMap[normalized];
      if (canonical != null) {
        return canonical;
      }
    }

    return trimmed;
  }

  List<Map<String, String>> _mapsFor(AppLanguage preferredLanguage) {
    switch (preferredLanguage) {
      case AppLanguage.en:
        return <Map<String, String>>[
          canonicalByEnglishAlias,
          canonicalByKoreanAlias,
          canonicalByJapaneseAlias,
          canonicalByChineseAlias,
        ];
      case AppLanguage.zhHans:
        return <Map<String, String>>[
          canonicalByChineseAlias,
          canonicalByEnglishAlias,
          canonicalByKoreanAlias,
          canonicalByJapaneseAlias,
        ];
      case AppLanguage.ja:
        return <Map<String, String>>[
          canonicalByJapaneseAlias,
          canonicalByEnglishAlias,
          canonicalByKoreanAlias,
          canonicalByChineseAlias,
        ];
    }
  }

  static void _putAlias(
    Map<String, String> target, {
    required String? alias,
    required String canonicalKoreanName,
  }) {
    final String? normalized = _normalize(alias);
    if (normalized == null) {
      return;
    }
    target.putIfAbsent(normalized, () => canonicalKoreanName);
  }

  static String? _normalize(String? value) {
    final String collapsed =
        value?.trim().replaceAll(RegExp(r'\s+'), ' ') ?? '';
    if (collapsed.isEmpty) {
      return null;
    }
    return collapsed.toLowerCase();
  }
}
