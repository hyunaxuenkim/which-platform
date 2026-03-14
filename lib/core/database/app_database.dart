import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/line_stations.dart';
import 'tables/lines.dart';
import 'tables/stations.dart';
import 'tables/transfers.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: <Type>[
    Stations,
    Lines,
    LineStations,
    Transfers,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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
