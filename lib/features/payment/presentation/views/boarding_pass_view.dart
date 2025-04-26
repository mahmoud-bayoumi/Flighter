import 'package:flighter/features/payment/presentation/views/widgets/boarding_pass_widgets/boarding_pass_view_body.dart';
import 'package:flutter/material.dart';

class BoardingPassView extends StatelessWidget {
  const BoardingPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boarding Pass'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: const BoardingPassViewBody(),
    );
  }
}
