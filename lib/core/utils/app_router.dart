import 'package:flighter/features/auth/presentation/views/check_your_email_view.dart';
import 'package:flighter/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flighter/features/auth/presentation/views/set_new_password_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_in_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_up_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/flight_detailes_view.dart';
import 'package:flighter/features/cancel_your_ticket/presentation/views/cancel_your_ticket_view.dart';
import 'package:flighter/features/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/choose_seat_view.dart';
import 'package:flighter/features/home/presentation/views/search_flight_view.dart';
import 'package:flighter/features/payment/presentation/views/add_payment_view.dart';
import 'package:flighter/features/payment/presentation/views/boarding_pass_view.dart';
import 'package:flighter/features/payment/presentation/views/payment_view.dart';
import 'package:flighter/features/profile/presentation/views/about_us_view.dart';
import 'package:flighter/features/profile/presentation/views/change_password.dart';
import 'package:flighter/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flighter/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/profile/presentation/views/privacy_and_policy.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignInView';
  static const String kSignUpView = '/SignUpView';
  static const String kForgotPasswordView = '/ForgotPassword';
  static const String kCheckYourEmailView = '/CheckYourEmailView';
  static const String kSetNewPasswordView = '/SetNewPassword';
  static const String kChangePassword = '/ChangePassword';
  static const String kNavigation = '/NavigationHome';
  static const String kSearchFlightView = '/SearchViewBody';
  static const String kChooseSeat = '/ChooseSeat';
  static const String kCancelYourTicket = '/CancelYourTicket';
  static const String kFlightDetailes = '/FlightDetailes';
  static const String kEditProfileView = '/EditProfileView';
  static const String kPayment = '/Payment';
  static const String kBoardingPass = '/BoardingPass';
  static const String kAddPayment = '/AddPayment';

  static const String kAboutUs = '/AboutUs';
  static const String kPrivacyAndPolicy = '/PrivacyAndPolicy';
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
        builder: (context, state) => const SetNewPasswordView(),
      ),
      GoRoute(
        path: kNavigation,
        builder: (context, state) => const BottomNavigationBarView(),
      ),
      GoRoute(
        path: kSearchFlightView,
        builder: (context, state) => const SearchFlightView(),
      ),
      GoRoute(
        path: kChooseSeat,
        builder: (context, state) => const ChooseSeatView(),
      ),
      GoRoute(
        path: kFlightDetailes,
        builder: (context, state) => const FlightDetailesView(),
      ),
      GoRoute(
        path: kChangePassword,
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: kPayment,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: kBoardingPass,
        builder: (context, state) => const BoardingPassView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kCancelYourTicket,
        builder: (context, state) => const CancelYourTicketView(),
      ),

    ],
  );
}
