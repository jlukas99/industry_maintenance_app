import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:industry_maintenance_app/features/department_page/presentation/pages/department_page.dart';
import 'package:industry_maintenance_app/features/main_page/presentation/pages/main_page.dart';
import 'package:industry_maintenance_app/features/start_page.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/pages/add_zone_page.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/pages/zone_page.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

class MyPageRouter {
  GoRouter get myRouter => _myRouter;
  static final _myRouter = GoRouter(
    navigatorKey: rootNavigationKey,
    routes: <RouteBase>[
      GoRoute(
        name: 'start_page',
        path: '/',
        builder: (context, state) => const StartPage(),
      ),
      GoRoute(
        name: 'main_page',
        path: '/main_page/:uid',
        builder: (context, state) {
          final userId = state.pathParameters['uid'] ?? '';
          return MainPage(uid: userId);
        },
        // pageBuilder:
      ),
      GoRoute(
        name: 'login_page',
        path: '/login_page',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'factory_zones',
        path: '/factory_zone/:uid',
        builder: (context, state) {
          final userID = state.pathParameters['uid'] ?? '';
          return ZonePage(uid: userID);
        },
      ),
      GoRoute(
        name: 'add_factory_zone',
        path: '/add_zone_page/:uid',
        builder: (context, state) {
          final userID = state.pathParameters['uid'];
          return AddZonePage(
            uid: userID,
          );
        },
      ),
      GoRoute(
        name: 'department_page',
        path: '/department/:uid/:zoneName',
        builder: (context, state) {
          final userId = state.pathParameters['uid'] ?? '';
          final zoneName = state.pathParameters['zoneName'] ?? '';
          return DepartmentPage(
            zoneName: zoneName,
            uid: userId,
          );
        },
      ),
    ],
  );
}
