import 'package:crypto_core/main.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter goRouter = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        //check if logged in

        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MyHomePage(title: 'title'),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => MyHomePage(title: 'title'),
        )
      ]);
}
