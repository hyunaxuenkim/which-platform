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

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 4) {
        // Current schema is still in active design. Rebuild the local DB
        // instead of carrying forward partial dev-time schemas.
        await customStatement('PRAGMA foreign_keys = OFF');
        await customStatement('DROP TABLE IF EXISTS direction_policies');
        await customStatement('DROP TABLE IF EXISTS transfers');
        await customStatement('DROP TABLE IF EXISTS line_stations');
        await customStatement('DROP TABLE IF EXISTS lines');
        await customStatement('DROP TABLE IF EXISTS stations');
        await m.createAll();
        await customStatement('PRAGMA foreign_keys = ON');
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
