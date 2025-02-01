enum RoutePaths {
  home,
  splash,
  signup,
  login,
  getStarted,
  forgotPassword,
}

// Extension to get the route path from the enum
extension RoutePathsExtension on RoutePaths {
  String get path {
    switch (this) {
      case RoutePaths.home:
        return '/home';
      case RoutePaths.splash:
        return '/splash';
      case RoutePaths.signup:
        return '/signup';
      case RoutePaths.login:
        return '/login';
      case RoutePaths.getStarted:
        return '/get-started';
      case RoutePaths.forgotPassword:
        return '/forgot-password';
    }
  }
}
