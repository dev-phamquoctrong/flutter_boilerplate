enum AppRoute {
  user,
  userDetail,
  theme,
  errorDialog,
}

extension AppRouteHelper on AppRoute {
  String get path {
    return switch (this) {
      AppRoute.user => '/user',
      AppRoute.userDetail => '/user/detail',
      AppRoute.theme => '/profile',
      AppRoute.errorDialog => '/error_dialog',
    };
  }

  String get name {
    return switch (this) {
      AppRoute.user => 'User',
      AppRoute.userDetail => 'UserDetail',
      AppRoute.theme => 'Profile',
      AppRoute.errorDialog => 'ErrorDialog',
    };
  }
}
