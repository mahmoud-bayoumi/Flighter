import 'package:flighter/features/auth/presentation/views/sign_in_view.dart';
import 'package:flighter/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignInView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      // Auth - views 
      GoRoute(
        path: kSignInView,
        builder: (context, state) => const SignInView(),
      ),
  /*    GoRoute(
        path: kHomeView,
        builder: (context, state) => Container(),
      ), 
  */
    ],
  );
}
