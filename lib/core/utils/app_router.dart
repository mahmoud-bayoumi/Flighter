import 'package:flighter/features/auth/presentation/views/check_your_email_view.dart';
import 'package:flighter/features/auth/presentation/views/check_your_email_view_for_forget_pass.dart';
import 'package:flighter/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flighter/features/auth/presentation/views/set_new_password_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_in_view.dart';
import 'package:flighter/features/auth/presentation/views/sign_up_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/flight_detailes_view.dart';
import 'package:flighter/features/cancel_your_ticket/presentation/views/cancel_your_ticket_view.dart';
import 'package:flighter/features/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/choose_seat_view.dart';
import 'package:flighter/features/home/presentation/views/search_flight_view.dart';
import 'package:flighter/features/integration/eventk_integration/presentation/views/events_view.dart';
import 'package:flighter/features/integration/hotel_integration/hotels_view.dart';
import 'package:flighter/features/payment/presentation/views/boarding_pass_view.dart';
import 'package:flighter/features/profile/presentation/views/about_us_view.dart';
import 'package:flighter/features/profile/presentation/views/change_password.dart';
import 'package:flighter/features/profile/presentation/views/delete_account_view.dart';
import 'package:flighter/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flighter/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/integration/eventk_integration/data/models/event_model/event_model.dart';
import '../../features/integration/eventk_integration/presentation/views/events_details_view.dart';
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
  static const String kCheckYourEmailViewForForgetPass =
      '/CheckYourEmailForForgetPass';
  static const String kBookingsNavigation = '/Bookings';
  static const String kOffersNavigation = '/Offers';
  static const String kAboutUs = '/AboutUs';
  static const String kPrivacyAndPolicy = '/PrivacyAndPolicy';

  static const String kDeleteAccount = '/DeleteAccount';

  static const String kEvents = '/Events';
  static const String kEventDeatils = '/EventDetails';
  static const String kHotels = '/Hotels';
  static const String kRefersh = '/refresh';
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
        builder: (context, state) {
          final email = state.extra as String;
          return CheckYourEmailView(email: email);
        },
      ),
      GoRoute(
        path: kCheckYourEmailViewForForgetPass,
        builder: (context, state) {
          final email = state.extra as String;
          return CheckYourEmailForForgetPassView(email: email);
        },
      ),
      GoRoute(
          path: kSetNewPasswordView,
          builder: (context, state) {
            final email = state.extra as String;
            return SetNewPasswordView(
              email: email,
            );
          }),
      GoRoute(
        path: kNavigation,
        builder: (context, state) => const BottomNavigationBarView(),
      ),
      GoRoute(
        path: kBookingsNavigation,
        builder: (context, state) => const BottomNavigationBarView(
          intialIndex: 1,
        ),
      ),
      GoRoute(
        path: kOffersNavigation,
        builder: (context, state) => const BottomNavigationBarView(
          intialIndex: 2,
        ),
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
      GoRoute(
        path: kAboutUs,
        builder: (context, state) => const AboutUsView(),
      ),
      GoRoute(
        path: kPrivacyAndPolicy,
        builder: (context, state) => const PrivacyAndPolicy(),
      ),
      GoRoute(
        path: kDeleteAccount,
        builder: (context, state) => const DeleteAccountView(),
      ),
      GoRoute(
        path: kEvents,
        builder: (context, state) => const EventsView(),
      ),
      GoRoute(
        path: kEventDeatils,
        builder: (context, state) {
          final eventData = state.extra as EventModel;
          return EventDetailsView(event: eventData);
        },
      ),
      GoRoute(
        path: kHotels,
        builder: (context, state) => HotelsListView(
          toCountry: state.extra as String,
        ),
      ),
      GoRoute(
        path: kRefersh,
        builder: (context, state) => const SizedBox.shrink(),
      ),
    ],
  );
}
