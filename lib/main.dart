import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import 'package:flighter/core/utils/stripe_keys.dart';
import 'package:flighter/features/home/presentation/view_model/from_countries_cubit/from_countries_cubit_cubit.dart';
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

void main() {
  setupServerLocator();
  Stripe.publishableKey = StripeKeys.publishableKey;
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
            create: (context) =>
                FromCountriesCubit(getIt.get<FromRepoImpl>()),
          ),
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
