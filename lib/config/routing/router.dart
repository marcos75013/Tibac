import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petit_bac/config/routing/routes_catalog.dart';
import 'package:petit_bac/main.dart';
import 'package:petit_bac/pages/app_loading_page/app_loading_page.dart';
import 'package:petit_bac/pages/category_page/category_page.dart';
import 'package:petit_bac/pages/game/game_page.dart';

GoRouter appRouter = GoRouter(routes: routes);
List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: RoutesCatalog.categoryPage,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const CategoryPage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.appLoadingPage,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const AppLoadingPage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.homePage,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.choixLettrePage,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.compteReboursPage,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.gameParge,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const GamePage(letter: 'A', categories: [], initialScoreTotal: 0),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.createProfile,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  ),
  GoRoute(
    path: RoutesCatalog.mentionsLegales,
    pageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  )

];

