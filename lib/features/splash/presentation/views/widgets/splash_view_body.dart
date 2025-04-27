// ignore_for_file: use_build_context_synchronously
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/features/home/presentation/view_model/to_counties_cubit/to_countries_cubit_dart_cubit.dart';
import 'package:flighter/features/splash/presentation/views/widgets/animated_description.dart';
import 'package:flighter/features/splash/presentation/views/widgets/flighter_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/secure_storage.dart';
import '../../../../home/presentation/view_model/from_countries_cubit/from_countries_cubit_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> planeAnimation;
  late Animation<Offset> flighterAnimation;
  late Animation<Offset> descriptionAnimation;
  final SecureStorageService _secureStorageService =
      const SecureStorageService();
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToAuthView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          FlighterLogo(
            planeAnimation: planeAnimation,
            flighterAnimation: flighterAnimation,
          ),
          const Spacer(
            flex: 1,
          ),
          AnimatedDescription(descriptionAnimation: descriptionAnimation),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    planeAnimation = Tween<Offset>(
      begin: const Offset(-5, 10),
      end: Offset.zero,
    ).animate(animationController);

    flighterAnimation = Tween<Offset>(
      begin: const Offset(10, 0),
      end: Offset.zero,
    ).animate(animationController);

    descriptionAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(animationController);

    // start animation
    animationController.forward();
  }

  void navigateToAuthView() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (await _secureStorageService.getToken(tokenKey) != null) {
          BlocProvider.of<FromCountriesCubit>(context).getFromCountries();
          BlocProvider.of<ToCountriesCubit>(context).getToCountries();
          GoRouter.of(context).pushReplacement(AppRouter.kNavigation);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
        }
      },
    );
  }
}
