import '../../settings/domain/app_language.dart';
import 'resolved_station_display_name.dart';

class StationDisplayNameFormatter {
  const StationDisplayNameFormatter();

  static const String missingInformationText = 'no information';

  String format({
    required AppLanguage language,
    required String? rawStationName,
    String? koreanName,
    String? englishName,
    String? japaneseName,
    String? chineseName,
  }) {
    return resolve(
      language: language,
      rawStationName: rawStationName,
      koreanName: koreanName,
      englishName: englishName,
      japaneseName: japaneseName,
      chineseName: chineseName,
    ).fullText;
  }

  ResolvedStationDisplayName resolve({
    required AppLanguage language,
    required String? rawStationName,
    String? koreanName,
    String? englishName,
    String? japaneseName,
    String? chineseName,
  }) {
    switch (language) {
      case AppLanguage.en:
        return _resolveEnglish(
          rawStationName: rawStationName,
          koreanName: koreanName,
          englishName: englishName,
        );
      case AppLanguage.zhHans:
        return _resolveCjk(
          rawStationName: rawStationName,
          koreanName: koreanName,
          englishName: englishName,
          localizedName: chineseName,
        );
      case AppLanguage.ja:
        return _resolveCjk(
          rawStationName: rawStationName,
          koreanName: koreanName,
          englishName: englishName,
          localizedName: japaneseName,
        );
    }
  }

  ResolvedStationDisplayName _resolveEnglish({
    required String? rawStationName,
    required String? koreanName,
    required String? englishName,
  }) {
    return ResolvedStationDisplayName(
      primary: _firstAvailable(<String?>[
        englishName,
        koreanName,
        rawStationName,
      ]),
    );
  }

  ResolvedStationDisplayName _resolveCjk({
    required String? rawStationName,
    required String? koreanName,
    required String? englishName,
    required String? localizedName,
  }) {
    final String primaryName = _firstAvailable(<String?>[
      localizedName,
      englishName,
      koreanName,
      rawStationName,
    ]);
    final String? normalizedEnglishName = _normalize(englishName);

    if (normalizedEnglishName == null) {
      return ResolvedStationDisplayName(primary: primaryName);
    }

    if (_equalsIgnoreCase(primaryName, normalizedEnglishName)) {
      return ResolvedStationDisplayName(primary: primaryName);
    }

    return ResolvedStationDisplayName(
      primary: primaryName,
      secondary: normalizedEnglishName,
    );
  }

  String _firstAvailable(List<String?> values) {
    for (final String? value in values) {
      final String? normalized = _normalize(value);
      if (normalized != null) {
        return normalized;
      }
    }
    return missingInformationText;
  }

  String? _normalize(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  bool _equalsIgnoreCase(String left, String right) {
    return left.toLowerCase() == right.toLowerCase();
  }
}
