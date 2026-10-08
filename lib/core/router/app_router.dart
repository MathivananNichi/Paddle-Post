import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paddle_post/core/router/app_routes.dart';
import 'package:paddle_post/features/auth/presentation/viewmodels/auth_controller.dart';
import 'package:paddle_post/features/auth/presentation/views/login_view.dart';
import 'package:paddle_post/features/home/presentation/view/home_screen.dart';
import 'package:paddle_post/features/paddle_post/presentation/view/paddle_post_screen.dart';
import 'package:paddle_post/features/splash/presentation/view/splash_screen.dart';
import 'package:paddle_post/features/users/presentation/views/users_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// The app's [GoRouter], exposed as a Riverpod provider so it can react to
/// global auth state.
///
/// `redirect` is the single source of truth for navigation guards:
///  * while auth status is `unknown` → stay on the splash screen;
///  * unauthenticated → forced to `/login`;
///  * authenticated → kept out of `/login` and `/`.
///
/// A [ValueNotifier] bridges the Riverpod [AuthController] to go_router's
/// `refreshListenable`, so the router re-evaluates `redirect` on every auth
/// change.
@riverpod
GoRouter goRouter(Ref ref) {
  final refresh = ValueNotifier<AuthStatus>(ref.read(authControllerProvider));
  ref.listen<AuthStatus>(authControllerProvider, (_, next) => refresh.value = next);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: refresh,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splashName,
        pageBuilder: (context, state) =>
            _fadeTransitionPage(key: state.pageKey, child: const SplashScreen()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        pageBuilder: (context, state) =>
            _fadeTransitionPage(key: state.pageKey, child: const LoginView()),
      ),
      GoRoute(
        path: AppRoutes.users,
        name: AppRoutes.usersName,
        pageBuilder: (context, state) =>
            _fadeTransitionPage(key: state.pageKey, child: const UsersView()),
      ),
      GoRoute(
        path: AppRoutes.paddlePost,
        name: AppRoutes.paddlePostName,
        pageBuilder: (context, state) =>
            _fadeTransitionPage(key: state.pageKey, child: const PaddlePostScreen()),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        pageBuilder: (context, state) =>
            _fadeTransitionPage(key: state.pageKey, child: const HomeScreen()),
      ),
    ],
  );
}

/// Helper building a smooth fade transition between routes.
CustomTransitionPage<void> _fadeTransitionPage({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}
