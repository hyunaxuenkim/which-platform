import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'import/subway_line_info_importer.dart';

final Provider<AppDatabase> appDatabaseProvider = Provider<AppDatabase>((ref) {
  final AppDatabase database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final Provider<SubwayLineInfoImporter> subwayLineInfoImporterProvider =
    Provider<SubwayLineInfoImporter>((ref) {
      return SubwayLineInfoImporter(ref.watch(appDatabaseProvider));
    });
