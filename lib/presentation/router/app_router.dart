import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/router/route_helper.dart';
import 'package:flutter_boilerplate/presentation/ui/dialogs/app_alert_dialog.dart';
import 'package:flutter_boilerplate/presentation/ui/theme_setting/theme_setting_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/dialogs/dialog_page.dart';
import '../ui/main_home/view/main_home_page.dart';
import '../ui/user/view/user_detail_screen.dart';
import '../ui/user/view/user_screen.dart';

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: AppRoute.user.path,
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            },
            child: MainHomePage(shell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.user.path,
                builder: (context, state) {
                  return const UserScreen();
                },
              ),
              GoRoute(
                path: AppRoute.userDetail.path,
                builder: (context, state) {
                  return UserDetailScreen(text: state.extra as String);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.theme.path,
                builder: (context, state) {
                  return const ThemeSettingScreen();
                },
              ),
            ],
          ),
        ],
      ),
      // Dialogs
      GoRoute(
        path: AppRoute.errorDialog.path,
        pageBuilder: (context, state) {
          String? alert;
          if (state.extra != null) {
            alert = state.extra as String;
          }
          return DialogPage(
            child: AppAlertDialog(
              message: alert,
            ),
          );
        },
      ),
    ],
  );
}
