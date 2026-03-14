import 'package:drift/drift.dart';

import 'lines.dart';
import 'stations.dart';

class LineStations extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get lineId => integer().references(Lines, #id)();

  IntColumn get stationId => integer().references(Stations, #id)();

  TextColumn get stationCode => text()();

  TextColumn get stationNo => text().nullable()();

  IntColumn get orderIndex => integer()();

  TextColumn get branchKey => text().withDefault(const Constant('MAIN'))();

  BoolColumn get isTerminal => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => <Set<Column<Object>>>[
    <Column<Object>>{lineId, stationCode},
    <Column<Object>>{lineId, stationId, branchKey},
    <Column<Object>>{lineId, orderIndex, branchKey},
  ];
}
