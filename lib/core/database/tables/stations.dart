import 'package:drift/drift.dart';

class Stations extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nameKo => text()();

  TextColumn get nameEn => text().nullable()();

  TextColumn get nameJp => text().nullable()();

  TextColumn get nameCh => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
