import 'parsed_route_models.dart';
import 'route_view_data.dart';

class RouteViewDataMapper {
  static const String missingInformationText = 'no information';
  static const String defaultLineColorHex = '#9E9E9E';

  const RouteViewDataMapper();

  RouteViewData map(ParsedRoute route) {
    final String departureStationName = route.stationTrail.isEmpty
        ? missingInformationText
        : _fallbackText(route.stationTrail.first);
    final String arrivalStationName = route.stationTrail.isEmpty
        ? missingInformationText
        : _fallbackText(route.stationTrail.last);

    return RouteViewData(
      summary: RouteSummaryViewData(
        departureStationName: departureStationName,
        arrivalStationName: arrivalStationName,
        totalDurationText: _formatDuration(route.totalDurationSeconds),
        totalFareText: _formatFare(route.totalFare),
        transferCountText: _formatTransferCount(route.transferCount),
      ),
      legItems: route.legs
          .map(
            (RouteLeg leg) => RouteLegItemViewData(
              lineName: _fallbackText(leg.lineName),
              lineColorHex: _resolveLineColorHex(leg.lineName),
              directionLabel: _fallbackText(leg.directionLabel),
              directionPositiveExamplesText: _buildDirectionPositiveExamples(leg),
              directionNegativeExamplesText: missingInformationText,
              fromStationName: _fallbackText(leg.fromStationName),
              toStationName: _fallbackText(leg.toStationName),
              nextStationName: _fallbackText(leg.nextStationName),
              nextNegativeStationName: missingInformationText,
              stationTrailText: _formatStationTrail(leg.stationNames),
              stationCountText: _formatStationCount(leg.stationCount),
              durationText: _formatDuration(leg.durationSeconds),
              instructionText: _buildInstructionText(leg),
            ),
          )
          .toList(growable: false),
      transferItems: route.transfers
          .map(
            (TransferSegment transfer) => RouteTransferItemViewData(
              stationName: _fallbackText(transfer.stationName),
              fromLineName: _fallbackText(transfer.fromLineName),
              toLineName: _fallbackText(transfer.toLineName),
              toLineColorHex: _resolveLineColorHex(transfer.toLineName),
              walkingTimeText: _formatDuration(transfer.durationSeconds),
            ),
          )
          .toList(growable: false),
    );
  }

  String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainSeconds = seconds % 60;
    if (minutes == 0) {
      return '${remainSeconds}s';
    }
    if (remainSeconds == 0) {
      return '${minutes}m';
    }
    return '${minutes}m ${remainSeconds}s';
  }

  String _formatFare(int fare) {
    return '$fare KRW';
  }

  String _formatTransferCount(int transferCount) {
    return '$transferCount transfer${transferCount == 1 ? '' : 's'}';
  }

  String _formatStationCount(int stationCount) {
    return '$stationCount station${stationCount == 1 ? '' : 's'}';
  }

  String _formatStationTrail(List<String> stationNames) {
    final List<String> normalizedStationNames = stationNames
        .map(_fallbackText)
        .toList(growable: false);
    if (normalizedStationNames.isEmpty) {
      return missingInformationText;
    }
    return normalizedStationNames.join(' -> ');
  }

  String _buildDirectionPositiveExamples(RouteLeg leg) {
    final List<String> candidates = <String>[
      if (_hasText(leg.terminalStationName)) leg.terminalStationName!,
      _fallbackText(leg.toStationName),
    ];
    return _joinUniqueCandidates(candidates);
  }

  String _buildInstructionText(RouteLeg leg) {
    final String directionTarget = _firstAvailable(<String?>[
      leg.terminalStationName,
      leg.directionLabel,
      leg.nextStationName,
    ]);
    return 'Follow signs to $directionTarget';
  }

  String _joinUniqueCandidates(List<String> values) {
    final List<String> unique = <String>[];
    for (final String value in values) {
      if (!_hasText(value) || value == missingInformationText) {
        continue;
      }
      if (!unique.contains(value)) {
        unique.add(value);
      }
    }
    if (unique.isEmpty) {
      return missingInformationText;
    }
    return unique.join(', ');
  }

  String _firstAvailable(List<String?> values) {
    for (final String? value in values) {
      if (_hasText(value)) {
        return value!.trim();
      }
    }
    return missingInformationText;
  }

  bool _hasText(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  String _fallbackText(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return missingInformationText;
    }
    return trimmed;
  }

  String _resolveLineColorHex(String? lineName) {
    return _lineColorHexByName[_fallbackText(lineName)] ?? defaultLineColorHex;
  }
}

const Map<String, String> _lineColorHexByName = <String, String>{
  '1호선': '#0D3692',
  '2호선': '#33A23D',
  '3호선': '#FE5B10',
  '4호선': '#32A1C8',
  '5호선': '#8B50A4',
  '6호선': '#C55C1D',
  '7호선': '#54640D',
  '8호선': '#F14C82',
  '9호선': '#AA9872',
  '신분당선': '#D31145',
  '수인분당선': '#FABE00',
  '신림선': '#6789CA',
  '경의중앙선': '#77C4A3',
  '공항철도': '#0090D2',
};
