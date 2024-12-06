import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FailurePageWidget extends StatelessWidget {
  const FailurePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.error,
            size: 50,
          ),
          Text(
            'There Was An Error, Try Again!!',
            style: Styles.textStyle45.copyWith(
              color: Colors.black.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}
