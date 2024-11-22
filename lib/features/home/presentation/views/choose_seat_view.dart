import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseSeatView extends StatelessWidget {
  const ChooseSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Choose Seat',
          style: Styles.textStyle24,
        ),
      ),
    );
  }
}
