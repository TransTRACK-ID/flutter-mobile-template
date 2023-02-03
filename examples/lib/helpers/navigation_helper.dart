import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:result_test/helpers/user_helper.dart';
import 'package:result_test/modules/login/view/login_page.dart';
import 'package:result_test/modules/splash/view/splash_page.dart';
import 'package:result_test/utils/constants.dart';

class NavigationHelper {
  final GoRouter goRouter = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, routerState) {
      return const Center(
        child: Text('Page not found'),
      );
    },
    observers: [],
    routes: [
      ShellRoute(routes: [
        GoRoute(
          path: '/',
          name: 'SplashPage',
          builder: (context, routerState) => const SplashPage(),
          redirect: redirectWhenAuthenticate,
          routes: [
            GoRoute(
              path: 'login',
              name: 'LoginPage',
              // builder: (context, routerState) => const LoginPage(),
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: const LoginPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
              redirect: (context, routerState) {
                final loggedIn = GetIt.I<UserHelper>().isLoggedIn;

                if (!loggedIn) return null;

                return '/';
              },
            ),
          ],
        ),
      ])
    ],
  );

  static String? redirectWhenAuthenticate(
    BuildContext context,
    GoRouterState routerState,
  ) {
    final loggedIn = GetIt.I<UserHelper>().isLoggedIn;

    if (!loggedIn) return '/login';

    return '/dashboard';
  }

  void pop() {
    goRouter.pop();
  }

  void go(String location, {Object? extra}) {
    goRouter.go(location, extra: extra);
  }

  void goNamed(String name, {Object? extra}) {
    goRouter.goNamed(name, extra: extra);
  }

  void pushNamed(String name) {
    goRouter.pushNamed(name);
  }

  void goToSplash() {
    goNamed('SplashPage');
  }

  void goToLogin() {
    goNamed('LoginPage');
  }
}
