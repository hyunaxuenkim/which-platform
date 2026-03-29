import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../domain/station_search_lookup.dart';

final FutureProvider<StationSearchLookup> stationSearchLookupProvider =
    FutureProvider<StationSearchLookup>((ref) async {
      final database = ref.watch(appDatabaseProvider);
      return StationSearchLookup.load(database);
    });
