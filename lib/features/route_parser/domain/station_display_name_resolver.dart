import '../../../core/database/app_database.dart';
import '../../settings/domain/app_language.dart';
import 'resolved_station_display_name.dart';
import 'station_display_name_formatter.dart';

class StationDisplayNameResolver {
  const StationDisplayNameResolver({
    this.formatter = const StationDisplayNameFormatter(),
  });

  final StationDisplayNameFormatter formatter;

  Future<ResolvedStationDisplayName> resolveWithDatabase(
    AppDatabase database, {
    required AppLanguage language,
    required String? stationCode,
    required String? rawStationName,
  }) async {
    final StationDisplayNameLookup lookup = await StationDisplayNameLookup.load(
      database,
    );
    return resolve(
      lookup: lookup,
      language: language,
      stationCode: stationCode,
      rawStationName: rawStationName,
    );
  }

  ResolvedStationDisplayName resolve({
    required StationDisplayNameLookup lookup,
    required AppLanguage language,
    required String? stationCode,
    required String? rawStationName,
  }) {
    final StationNameRecord? record = lookup.find(
      stationCode: stationCode,
      rawStationName: rawStationName,
    );
    return formatter.resolve(
      language: language,
      rawStationName: rawStationName,
      koreanName: record?.koreanName,
      englishName: record?.englishName,
      japaneseName: record?.japaneseName,
      chineseName: record?.chineseName,
    );
  }
}

class StationDisplayNameLookup {
  StationDisplayNameLookup({
    required this.recordByStationCode,
    required this.recordByExactKoreanName,
  });

  static Future<StationDisplayNameLookup> load(AppDatabase database) async {
    final List<Station> stations = await database
        .select(database.stations)
        .get();
    final List<LineStation> lineStations = await database
        .select(database.lineStations)
        .get();

    final Map<int, StationNameRecord> recordByStationId =
        <int, StationNameRecord>{};
    for (final Station station in stations) {
      recordByStationId[station.id] = StationNameRecord(
        koreanName: station.nameKo,
        englishName: station.nameEn,
        japaneseName: station.nameJp,
        chineseName: station.nameCh,
      );
    }

    final Map<String, StationNameRecord> recordByStationCode =
        <String, StationNameRecord>{};
    final Map<String, StationNameRecord> recordByExactKoreanName =
        <String, StationNameRecord>{};

    for (final Station station in stations) {
      final String? normalizedKoreanName = _normalize(station.nameKo);
      if (normalizedKoreanName == null) {
        continue;
      }
      final StationNameRecord? record = recordByStationId[station.id];
      if (record == null) {
        continue;
      }
      recordByExactKoreanName.putIfAbsent(normalizedKoreanName, () => record);
    }

    for (final LineStation row in lineStations) {
      final String? normalizedStationCode = _normalize(row.stationCode);
      final StationNameRecord? record = recordByStationId[row.stationId];
      if (normalizedStationCode == null || record == null) {
        continue;
      }
      recordByStationCode.putIfAbsent(normalizedStationCode, () => record);
    }

    return StationDisplayNameLookup(
      recordByStationCode: recordByStationCode,
      recordByExactKoreanName: recordByExactKoreanName,
    );
  }

  final Map<String, StationNameRecord> recordByStationCode;
  final Map<String, StationNameRecord> recordByExactKoreanName;

  StationNameRecord? find({
    required String? stationCode,
    required String? rawStationName,
  }) {
    final String? normalizedStationCode = _normalize(stationCode);
    if (normalizedStationCode != null) {
      final StationNameRecord? byCode =
          recordByStationCode[normalizedStationCode];
      if (byCode != null) {
        return byCode;
      }
    }

    final String? normalizedRawStationName = _normalize(rawStationName);
    if (normalizedRawStationName == null) {
      return null;
    }
    return recordByExactKoreanName[normalizedRawStationName];
  }

  static String? _normalize(String? value) {
    final String trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }
}

class StationNameRecord {
  const StationNameRecord({
    required this.koreanName,
    this.englishName,
    this.japaneseName,
    this.chineseName,
  });

  final String koreanName;
  final String? englishName;
  final String? japaneseName;
  final String? chineseName;
}
