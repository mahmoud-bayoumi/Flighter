import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import 'package:flighter/core/utils/stripe_keys.dart';
import 'package:flighter/features/book_ticket/data/repos/get_seats_repo/get_seats_repo_impl.dart';
import 'package:flighter/features/book_ticket/data/repos/ticket_summary_repo/ticket_summary_repo_impl.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flighter/features/bookings/data/repos/bookings_repo/bookings_repo_impl.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import 'package:flighter/features/home/data/repos/airlines_repo/airlines_repo_impl.dart';
import 'package:flighter/features/home/presentation/view_model/airlines_cubit/airlines_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/from_countries_cubit/from_countries_cubit_cubit.dart';
import 'package:flighter/features/home/data/repos/to_countries_repo/to_repo_impl.dart';
import 'package:flighter/features/home/presentation/view_model/to_counties_cubit/to_countries_cubit_dart_cubit.dart';
import 'package:flighter/features/offers/data/repos/get_offer_repo/get_offers_repo_impl.dart';
import 'package:flighter/features/offers/presentation/view_model/get_offer_cubit/get_offer_cubit.dart';
import 'package:flighter/features/payment/data/repos/pay_later_history/pay_later_repo_impl.dart';
import 'package:flighter/features/payment/data/repos/pay_now_repo/pay_now_repo_impl.dart';
import 'package:flighter/features/payment/data/repos/refund_repo/refund_repo_impl.dart';
import 'package:flighter/features/payment/presentation/view_model/pay_later_booking_cubit/pay_later_booking_cubit.dart';
import 'package:flighter/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flighter/features/payment/presentation/view_model/refund_cubit/refund_cubit.dart';
import 'package:flighter/features/profile/data/repos/get_profile_data/get_profile_data_repo_impl.dart';
import 'package:flighter/features/profile/data/repos/get_profile_photo_repo/get_profile_photo_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/from_countries_repo/from_repo_impl.dart';
import 'features/home/data/repos/search_repo/search_repo_impl.dart';
import 'features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() {
  setupServerLocator();
  tz.initializeTimeZones();
  Stripe.publishableKey = StripeKeys.publishableKey;
  AwesomeNotifications().initialize(
      'resource://drawable/ic_stat_logo',
      [
        NotificationChannel(
            channelKey: notChannelKey,
            channelName: notChannelName,
            channelDescription: 'Notification For Payment',
            playSound: true,
            channelShowBadge: true,
            defaultColor: Colors.blue,
            ledColor: Colors.white,
            importance: NotificationImportance.Max)
      ],
      debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetProfilePhotoCubit(getIt.get<GetProfilePhotoRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                GetProfileDataCubit(getIt.get<GetProfileDataRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => ConnectivityCubit(),
          ),
          BlocProvider(
            create: (context) => FromCountriesCubit(getIt.get<FromRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => AirlinesCubit(getIt.get<AirlinesRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => ToCountriesCubit(getIt.get<ToRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => GetSeatsCubit(getIt.get<GetSeatsRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                TicketSummaryCubit(getIt.get<TicketSummaryRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => GetOfferCubit(getIt.get<GetOffersRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => GetSeatsCubit(getIt.get<GetSeatsRepoImpl>()),
          ),
          BlocProvider(
              create: (context) => PaymentCubit(getIt.get<PayNowRepoImpl>())),
          BlocProvider(
              create: (context) =>
                  GetBookingsCubit(getIt.get<BookingsRepoImpl>())),
          BlocProvider(
              create: (context) =>
                  PayLaterBookingCubit(getIt.get<PayLaterRepoImpl>())),
          BlocProvider(
              create: (context) => RefundCubit(getIt.get<RefundRepoImpl>()))
        ],
        child: MaterialApp.router(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins-Regular',
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
