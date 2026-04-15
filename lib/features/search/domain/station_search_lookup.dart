import '../../../core/database/app_database.dart';
import '../../settings/domain/app_language.dart';

class StationSearchLookup {
  StationSearchLookup._({
    required this.canonicalByKoreanAlias,
    required this.canonicalByEnglishAlias,
    required this.canonicalByJapaneseAlias,
    required this.canonicalByChineseAlias,
    required List<_StationSearchEntry> entries,
  }) : _entries = entries;

  static Future<StationSearchLookup> load(AppDatabase database) async {
    final List<Station> stations = await database
        .select(database.stations)
        .get();
    final Map<String, String> canonicalByKoreanAlias = <String, String>{};
    final Map<String, String> canonicalByEnglishAlias = <String, String>{};
    final Map<String, String> canonicalByJapaneseAlias = <String, String>{};
    final Map<String, String> canonicalByChineseAlias = <String, String>{};
    final List<_StationSearchEntry> entries = <_StationSearchEntry>[];

    for (int index = 0; index < stations.length; index++) {
      final Station station = stations[index];
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

      entries.add(
        _StationSearchEntry(
          canonicalKoreanName: canonicalKoreanName,
          koreanName: station.nameKo,
          englishName: station.nameEn,
          japaneseName: station.nameJp,
          chineseName: station.nameCh,
          loadOrder: index,
        ),
      );
    }

    return StationSearchLookup._(
      canonicalByKoreanAlias: canonicalByKoreanAlias,
      canonicalByEnglishAlias: canonicalByEnglishAlias,
      canonicalByJapaneseAlias: canonicalByJapaneseAlias,
      canonicalByChineseAlias: canonicalByChineseAlias,
      entries: entries,
    );
  }

  final Map<String, String> canonicalByKoreanAlias;
  final Map<String, String> canonicalByEnglishAlias;
  final Map<String, String> canonicalByJapaneseAlias;
  final Map<String, String> canonicalByChineseAlias;
  final List<_StationSearchEntry> _entries;

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

  List<StationSearchSuggestion> filterSuggestions(
    String query, {
    required AppLanguage preferredLanguage,
  }) {
    final String? normalizedQuery = _normalize(query);
    if (normalizedQuery == null) {
      return const <StationSearchSuggestion>[];
    }

    final List<_RankedSuggestion> matches = <_RankedSuggestion>[];
    for (final _StationSearchEntry entry in _entries) {
      final _SuggestionMatch? match = _matchEntry(
        entry,
        normalizedQuery: normalizedQuery,
        preferredLanguage: preferredLanguage,
      );
      if (match == null) {
        continue;
      }

      matches.add(
        _RankedSuggestion(
          suggestion: StationSearchSuggestion(
            canonicalKoreanName: entry.canonicalKoreanName,
            displayText: _displayTextFor(entry, preferredLanguage),
          ),
          matchRank: match.matchRank,
          aliasPriority: match.aliasPriority,
          loadOrder: entry.loadOrder,
        ),
      );
    }

    matches.sort((_RankedSuggestion left, _RankedSuggestion right) {
      final int rankCompare = left.matchRank.compareTo(right.matchRank);
      if (rankCompare != 0) {
        return rankCompare;
      }

      final int aliasCompare = left.aliasPriority.compareTo(
        right.aliasPriority,
      );
      if (aliasCompare != 0) {
        return aliasCompare;
      }

      return left.loadOrder.compareTo(right.loadOrder);
    });

    final Set<String> seenCanonicalNames = <String>{};
    final List<StationSearchSuggestion> suggestions =
        <StationSearchSuggestion>[];
    for (final _RankedSuggestion match in matches) {
      if (!seenCanonicalNames.add(match.suggestion.canonicalKoreanName)) {
        continue;
      }
      suggestions.add(match.suggestion);
    }

    return suggestions;
  }

  _SuggestionMatch? _matchEntry(
    _StationSearchEntry entry, {
    required String normalizedQuery,
    required AppLanguage preferredLanguage,
  }) {
    final List<String?> aliases = _aliasesFor(entry, preferredLanguage);
    for (int index = 0; index < aliases.length; index++) {
      final String? normalizedAlias = _normalize(aliases[index]);
      if (normalizedAlias == null) {
        continue;
      }
      if (normalizedAlias.startsWith(normalizedQuery)) {
        return _SuggestionMatch(matchRank: 0, aliasPriority: index);
      }
    }

    for (int index = 0; index < aliases.length; index++) {
      final String? normalizedAlias = _normalize(aliases[index]);
      if (normalizedAlias == null) {
        continue;
      }
      if (normalizedAlias.contains(normalizedQuery)) {
        return _SuggestionMatch(matchRank: 1, aliasPriority: index);
      }
    }

    return null;
  }

  String _displayTextFor(
    _StationSearchEntry entry,
    AppLanguage preferredLanguage,
  ) {
    switch (preferredLanguage) {
      case AppLanguage.en:
        return _firstAvailable(<String?>[entry.englishName, entry.koreanName]);
      case AppLanguage.zhHans:
        return _firstAvailable(<String?>[
          entry.chineseName,
          entry.englishName,
          entry.koreanName,
        ]);
      case AppLanguage.ja:
        return _firstAvailable(<String?>[
          entry.japaneseName,
          entry.englishName,
          entry.koreanName,
        ]);
    }
  }

  List<String?> _aliasesFor(
    _StationSearchEntry entry,
    AppLanguage preferredLanguage,
  ) {
    switch (preferredLanguage) {
      case AppLanguage.en:
        return <String?>[
          entry.englishName,
          entry.koreanName,
          entry.japaneseName,
          entry.chineseName,
        ];
      case AppLanguage.zhHans:
        return <String?>[
          entry.chineseName,
          entry.englishName,
          entry.koreanName,
          entry.japaneseName,
        ];
      case AppLanguage.ja:
        return <String?>[
          entry.japaneseName,
          entry.englishName,
          entry.koreanName,
          entry.chineseName,
        ];
    }
  }

  String _firstAvailable(List<String?> values) {
    for (final String? value in values) {
      final String? normalized = _trim(value);
      if (normalized != null) {
        return normalized;
      }
    }
    return '';
  }

  String? _trim(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
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

class StationSearchSuggestion {
  const StationSearchSuggestion({
    required this.canonicalKoreanName,
    required this.displayText,
  });

  final String canonicalKoreanName;
  final String displayText;
}

class _StationSearchEntry {
  const _StationSearchEntry({
    required this.canonicalKoreanName,
    required this.koreanName,
    required this.englishName,
    required this.japaneseName,
    required this.chineseName,
    required this.loadOrder,
  });

  final String canonicalKoreanName;
  final String koreanName;
  final String? englishName;
  final String? japaneseName;
  final String? chineseName;
  final int loadOrder;
}

class _SuggestionMatch {
  const _SuggestionMatch({
    required this.matchRank,
    required this.aliasPriority,
  });

  final int matchRank;
  final int aliasPriority;
}

class _RankedSuggestion {
  const _RankedSuggestion({
    required this.suggestion,
    required this.matchRank,
    required this.aliasPriority,
    required this.loadOrder,
  });

  final StationSearchSuggestion suggestion;
  final int matchRank;
  final int aliasPriority;
  final int loadOrder;
}
