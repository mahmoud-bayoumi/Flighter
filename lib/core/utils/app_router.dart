import 'package:flighter/features/auth/presentation/views/check_your_email_view.dart';
import 'package:flighter/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_in_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_up_view.dart';
import 'package:flighter/features/auth/presentation/views/widgets/set_new_password_view_body.dart';
import 'package:flighter/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignInView';
  static const String kSignUpView = '/SignUpView';
  static const String kForgotPasswordView = '/ForgotPassword';
  static const String kCheckYourEmailView = '/CheckYourEmailView';
  static const String kSetNewPasswordView = '/SetNewPassword';
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
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kCheckYourEmailView,
        builder: (context, state) => const CheckYourEmailView(),
      ),
      GoRoute(
        path: kSetNewPasswordView,
        builder: (context, state) => const SetNewPasswordBody(),
      ),
      /*    GoRoute(
        path: kHomeView,
        builder: (context, state) => Container(),
      ), 
  */
    ],
  );
}
