import 'parsed_route_models.dart';
import 'route_view_data.dart';

class RouteViewDataMapper {
  const RouteViewDataMapper();

  RouteViewData map(ParsedRoute route) {
    final String departureStationName = route.stationTrail.first;
    final String arrivalStationName = route.stationTrail.last;

    return RouteViewData(
      summary: RouteSummaryViewData(
        departureStationName: departureStationName,
        arrivalStationName: arrivalStationName,
        totalDurationText: _formatDuration(route.totalDurationSeconds),
        totalFareText: '${route.totalFare}원',
        transferCountText: '환승 ${route.transferCount}회',
      ),
      legItems: route.legs
          .map(
            (RouteLeg leg) => RouteLegItemViewData(
              lineName: leg.lineName,
              directionLabel: leg.directionLabel,
              fromStationName: leg.fromStationName,
              toStationName: leg.toStationName,
              nextStationName: leg.nextStationName,
              stationTrailText: leg.stationNames.join(' → '),
              stationCountText: '${leg.stationCount}개 역',
              durationText: _formatDuration(leg.durationSeconds),
            ),
          )
          .toList(growable: false),
      transferItems: route.transfers
          .map(
            (TransferSegment transfer) => RouteTransferItemViewData(
              stationName: transfer.stationName,
              fromLineName: transfer.fromLineName,
              toLineName: transfer.toLineName,
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
      return '$remainSeconds초';
    }
    if (remainSeconds == 0) {
      return '$minutes분';
    }
    return '$minutes분 $remainSeconds초';
  }
}
