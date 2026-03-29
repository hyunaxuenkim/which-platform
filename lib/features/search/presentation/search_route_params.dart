class SearchRouteParams {
  const SearchRouteParams({
    required this.origin,
    required this.destination,
    required this.voiceGuidanceEnabled,
  });

  final String origin;
  final String destination;
  final bool voiceGuidanceEnabled;
}
