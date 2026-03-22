import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:which_platform/core/database/app_database.dart';
import 'package:which_platform/core/database/import/subway_line_info_importer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('imports asset data with branch duplication and terminal flags', () async {
    final AppDatabase database = AppDatabase.forTesting(NativeDatabase.memory());
    final SubwayLineInfoImporter importer = SubwayLineInfoImporter(database);

    final SubwayLineInfoImportResult result = await importer.importFromAsset();

    final lines = await database.select(database.lines).get();
    final stations = await database.select(database.stations).get();
    final lineStations = await database.select(database.lineStations).get();
    final directionPolicies = await database
        .select(database.directionPolicies)
        .get();
    final stationTransitionOverrides = await database
        .select(database.stationTransitionOverrides)
        .get();

    expect(result.processedRows, greaterThan(100));
    expect(lines.map((row) => row.name), containsAll(<String>['01호선', '02호선', '06호선', '09호선', '수인분당선']));
    expect(stations.length, greaterThan(100));
    expect(lineStations.length, greaterThan(stations.length));

    final guroBranchKeys = lineStations
        .where((row) => row.stationCode == '1701')
        .map((row) => row.branchKey)
        .toSet();
    expect(guroBranchKeys, <String>{
      'LINE1_MAIN',
      'LINE1_GYEONGIN',
      'LINE1_GYEONGBU',
    });

    final gangdongBranchKeys = lineStations
        .where((row) => row.stationCode == '2549')
        .map((row) => row.branchKey)
        .toSet();
    expect(gangdongBranchKeys, <String>{
      'LINE5_MAIN',
      'LINE5_HANAM_BRANCH',
      'LINE5_MACHEON_BRANCH',
    });

    final gwangmyeongTerminal = lineStations.singleWhere(
      (row) =>
          row.stationCode == '1750' &&
          row.branchKey == 'LINE1_GWANGMYEONG_SHUTTLE',
    );
    expect(gwangmyeongTerminal.isTerminal, isTrue);

    final seodongtanTerminal = lineStations.singleWhere(
      (row) =>
          row.stationCode == '1749' &&
          row.branchKey == 'LINE1_SEODONGTAN_SHUTTLE',
    );
    expect(seodongtanTerminal.isTerminal, isTrue);

    final loopRows = lineStations
        .where((row) => row.branchKey == 'LINE6_EUNGAM_LOOP')
        .toList();
    expect(loopRows, isNotEmpty);
    expect(loopRows.every((row) => row.isTerminal == false), isTrue);

    final line9Rows = lineStations
        .where((row) => row.branchKey == 'LINE9_MAIN')
        .toList();
    expect(line9Rows, isNotEmpty);
    expect(directionPolicies, isNotEmpty);
    expect(stationTransitionOverrides, isNotEmpty);

    await database.close();
  });
}
