import 'package:flighter/features/auth/presentation/views/widgets/check_your_email_body.dart';
import 'package:flutter/material.dart';


class CheckYourEmailView extends StatelessWidget {
  const CheckYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CheckYourEmailBody(),
    );
  }
}
