import 'package:drift/drift.dart';

class Lines extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().unique()();

  TextColumn get color => text().nullable()();

  TextColumn get lineType => text()
      .nullable()
      .check(lineType.isIn(const <String>['LINEAR', 'LOOP', 'BRANCH']))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
