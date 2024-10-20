import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

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
            style: Styles.textStyle25.copyWith(color: Colors.white),
          ),
        );
      },
      animation: descriptionAnimation,
    );
  }
}
