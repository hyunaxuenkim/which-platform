import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'line_metadata_catalog.dart';
import 'tables/direction_policies.dart';
import 'tables/line_stations.dart';
import 'tables/lines.dart';
import 'tables/stations.dart';
import 'tables/station_transition_overrides.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: <Type>[
    Stations,
    Lines,
    LineStations,
    DirectionPolicies,
    StationTransitionOverrides,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 10;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 10) {
        // Current schema is still in active design. Rebuild the local DB
        // instead of carrying forward partial dev-time schemas.
        await customStatement('PRAGMA foreign_keys = OFF');
        await customStatement('DROP TABLE IF EXISTS station_transition_overrides');
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

  Future<Map<String, String>> getLineColorHexByName() async {
    final List<Line> rows = await select(lines).get();
    final Map<String, String> result = <String, String>{};
    for (final Line row in rows) {
      final String? color = row.color?.trim();
      if (color == null || color.isEmpty) {
        continue;
      }
      result[canonicalizeLineName(row.name)] = color;
    }
    return result;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory databaseDirectory = await _resolveDatabaseDirectory();
    await databaseDirectory.create(recursive: true);
    final File file = File(
      p.join(databaseDirectory.path, 'which_platform.sqlite'),
    );

    return NativeDatabase.createInBackground(file);
  });
}

Future<Directory> _resolveDatabaseDirectory() async {
  final String? homePath = Platform.environment['HOME'];
  if (homePath == null || homePath.isEmpty) {
    return Directory.systemTemp;
  }

  if (Platform.isIOS) {
    return Directory(p.join(homePath, 'Documents'));
  }

  if (Platform.isAndroid) {
    return Directory(p.join(homePath, 'files'));
  }

  return Directory(homePath);
}
