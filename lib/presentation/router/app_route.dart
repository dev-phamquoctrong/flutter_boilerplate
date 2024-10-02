enum AppRoute {
  user,
  userDetail,
  theme,
  errorDialog,
  bottomSheetExample,
}

extension AppRouteExtension on AppRoute {
  String get path {
    return switch (this) {
      AppRoute.user => '/user',
      AppRoute.userDetail => '/user/detail',
      AppRoute.theme => '/profile',
      AppRoute.errorDialog => '/error_dialog',
      AppRoute.bottomSheetExample => '/bottom_sheet',
    };
  }

  String get name {
    return switch (this) {
      AppRoute.user => 'User',
      AppRoute.userDetail => 'UserDetail',
      AppRoute.theme => 'Profile',
      AppRoute.errorDialog => 'ErrorDialog',
      AppRoute.bottomSheetExample => 'BottomSheet',
    };
  }
}
