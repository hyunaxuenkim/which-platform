import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_page.dart';
import '../../features/search/presentation/search_page.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const SearchPage()),
    GoRoute(
      path: '/route',
      builder: (context, state) => RoutePlaceholderPage(
        params: state.extra is SearchRouteParams
            ? state.extra! as SearchRouteParams
            : null,
      ),
    ),
    GoRoute(path: '/debug', builder: (context, state) => const HomePage()),
  ],
);
