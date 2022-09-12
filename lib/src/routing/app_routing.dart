import 'package:dhikr/src/constants/enum_constant.dart';
import 'package:dhikr/src/features/screens/dashboard.dart';
import 'package:dhikr/src/features/screens/main_screen.dart';
import 'package:dhikr/src/features/screens/not_found_screen.dart';
import 'package:dhikr/src/features/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) => null,
    //refreshListenable: null,
    routes: [
      GoRoute(
        path: '/',
        name: AppRouter.dashboard.name,
        //: (_) => '/root/home',
        builder: (context, state) => const MainScreen(),
        // builder: (context, state) => MainScreen(tab: 'dashboard'),
        routes: [
          GoRoute(
            path: AppRouter.home.name,
            name: AppRouter.home.name,
            builder: (context, state) => const Home(),
            // pageBuilder: (context, state) => MaterialPage(
            //   key: state.pageKey,
            //   fullscreenDialog: true,
            //   child: const Home(),
            // ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
