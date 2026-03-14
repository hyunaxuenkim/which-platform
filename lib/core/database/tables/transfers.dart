import 'package:drift/drift.dart';

import 'line_stations.dart';

class Transfers extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName('outgoingTransfers')
  IntColumn get fromLineStationId => integer().references(LineStations, #id)();

  @ReferenceName('incomingTransfers')
  IntColumn get toLineStationId => integer().references(LineStations, #id)();

  IntColumn get walkingSeconds => integer()();

  TextColumn get transferType => text()
      .nullable()
      .check(
        transferType.isIn(const <String>['SAME_PLATFORM', 'NORMAL', 'LONG_WALK']),
      )();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => <Set<Column<Object>>>[
    <Column<Object>>{fromLineStationId, toLineStationId},
  ];
}
