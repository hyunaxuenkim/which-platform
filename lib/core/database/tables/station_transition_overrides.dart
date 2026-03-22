import 'package:drift/drift.dart';

import 'lines.dart';

class StationTransitionOverrides extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get lineId => integer().references(Lines, #id)();

  TextColumn get currentStationCode => text()();

  TextColumn get nextStationCode => text()();

  TextColumn get apiTerminalStationCode => text().nullable()();

  TextColumn get apiTerminalStationName => text().nullable()();

  TextColumn get apiDirection => text().nullable().check(
    apiDirection.isIn(const <String>['상행', '하행', '내선', '외선']),
  )();

  TextColumn get resolvedBranchKey => text()();

  TextColumn get prevStationCode => text().nullable()();

  IntColumn get priority => integer().withDefault(const Constant(0))();

  TextColumn get note => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
