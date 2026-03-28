import 'package:drift/drift.dart';

import 'lines.dart';

class DirectionPolicies extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get lineId => integer().references(Lines, #id)();

  TextColumn get branchKey => text().withDefault(const Constant('MAIN'))();

  TextColumn get directionKind => text().customConstraint(
    "CHECK (direction_kind IN ('UP', 'DOWN', 'INNER', 'OUTER', 'TERMINAL', 'BRANCH'))",
  )();

  TextColumn get apiDirection => text().nullable().customConstraint(
    "CHECK (api_direction IS NULL OR api_direction IN ('상행', '하행', '내선', '외선'))",
  )();

  TextColumn get apiTerminalStationCode => text().nullable()();

  TextColumn get displayLabelKo => text()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => <Set<Column<Object>>>[
    <Column<Object>>{
      lineId,
      branchKey,
      directionKind,
      apiDirection,
      apiTerminalStationCode,
    },
  ];
}
