

import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FlightColumnText extends StatelessWidget {
  const FlightColumnText({
    super.key,
    required this.text,
    required this.ans,
  });
  final String text, ans;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Styles.textStyle15.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          ans,
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}