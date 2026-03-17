import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/line_stations.dart';
import 'tables/lines.dart';
import 'tables/stations.dart';
import 'tables/direction_policies.dart';
import 'tables/transfers.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: <Type>[
    Stations,
    Lines,
    LineStations,
    DirectionPolicies,
    Transfers,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(stations, stations.nameJp);
        await m.addColumn(stations, stations.nameCh);
        await m.createTable(directionPolicies);
      }
    },
    beforeOpen: (OpeningDetails details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final File file = File(
      p.join(documentsDirectory.path, 'which_platform.sqlite'),
    );

    return NativeDatabase.createInBackground(file);
  });
}
