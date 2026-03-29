import 'package:go_router/go_router.dart';

import '../../features/route/presentation/route_page.dart';
import '../../features/search/presentation/search_page.dart';
import '../../features/search/presentation/search_route_params.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const SearchPage()),
    GoRoute(
      path: '/route',
      builder: (context, state) => RoutePage(
        params: state.extra is SearchRouteParams
            ? state.extra! as SearchRouteParams
            : null,
      ),
    ),
  ],
);
