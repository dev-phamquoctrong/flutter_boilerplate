import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/router/app_route.dart';
import 'package:flutter_boilerplate/presentation/router/bottom_sheet_page.dart';
import 'package:flutter_boilerplate/presentation/ui/theme_setting/theme_setting_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/main_home/view/main_home_page.dart';
import '../ui/modal/app_alert_dialog.dart';
import '../ui/modal/bottom_sheet_example.dart';
import '../ui/user/view/user_detail_screen.dart';
import '../ui/user/view/user_screen.dart';
import 'dialog_page.dart';

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: AppRoute.user.path,
    debugLogDiagnostics: kDebugMode,
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
            builder: (context) => AppAlertDialog(
              message: alert,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoute.bottomSheetExample.path,
        pageBuilder: (context, state) {
          return const BottomSheetPage(
            child: BottomSheetExample(),
            isScrollControlled: false,
          );
        },
      ),
    ],
  );
}
