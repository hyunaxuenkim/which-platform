class ResolvedStationDisplayName {
  const ResolvedStationDisplayName({required this.primary, this.secondary});

  final String primary;
  final String? secondary;

  String get fullText {
    final String? secondaryText = _normalize(secondary);
    if (secondaryText == null) {
      return primary;
    }
    return '$primary ($secondaryText)';
  }

  static String? _normalize(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }
}
