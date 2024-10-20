// ignore_for_file: use_build_context_synchronously
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/features/splash/presentation/views/widgets/animated_description.dart';
import 'package:flighter/features/splash/presentation/views/widgets/flighter_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
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

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
