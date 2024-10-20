
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedDescription extends StatelessWidget {
  const AnimatedDescription({
    super.key,
    required this.descriptionAnimation,
  });

  final Animation<Offset> descriptionAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: descriptionAnimation,
          child: Text(
            'Fly Smarter, Travel Better Book Now!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
            ),
          ),
        );
      },
      animation: descriptionAnimation,
    );
  }
}
