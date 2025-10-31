import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: _routes,
    errorBuilder: (context, state) => ErrorScreen(state: state),
    debugLogDiagnostics: true,
  );

  static final _routes = <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) => HomeScreen(navigationShell: navigationShell),
      branches: _branches,
    ),
  ];

  static final _branches = <StatefulShellBranch>[
    _homeBranch,
    _categoryBranch,
    _favoriteBranch,
  ];

  static final _homeBranch = StatefulShellBranch(
    navigatorKey: HomeView.homeNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(),
        routes: [
          GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return CustomTransitionPage(
                key: state.pageKey,
                child: MovieScreen(movieId: movieId),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              );
            },
          ),
        ],
      ),
    ],
  );

  static final _categoryBranch = StatefulShellBranch(
    navigatorKey: CategoryView.categoriesNavigatorKey,
    routes: <RouteBase>[
      GoRoute(path: '/category', builder: (context, state) => CategoryView()),
    ],
  );

  static final _favoriteBranch = StatefulShellBranch(
    navigatorKey: FavoriteView.favoritesNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/favorite',
        builder: (context, state) => FadeInRight(child: FavoriteView()),
      ),
    ],
  );
}
