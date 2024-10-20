import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlighterLogo extends StatelessWidget {
  const FlighterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          Text(
            'Flighter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
