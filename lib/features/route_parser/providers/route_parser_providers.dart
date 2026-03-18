import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/seoul_route_api_client.dart';

final Provider<SeoulRouteApiClient> seoulRouteApiClientProvider =
    Provider<SeoulRouteApiClient>((ref) {
      return SeoulRouteApiClient();
    });
