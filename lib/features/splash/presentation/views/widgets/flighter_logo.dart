import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlighterLogo extends StatelessWidget {
  const FlighterLogo(
      {super.key,
      required this.planeAnimation,
      required this.flighterAnimation});
  final Animation<Offset> planeAnimation;
  final Animation<Offset> flighterAnimation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          builder: (context, _) {
            return SlideTransition(
              position: planeAnimation,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            );
          },
          animation: planeAnimation,
        ),
        AnimatedBuilder(
          builder: (context, _) {
            return SlideTransition(
              position: flighterAnimation,
              child: Text(
                'Flighter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          animation: flighterAnimation,
        ),
      ],
    );
  }
}
