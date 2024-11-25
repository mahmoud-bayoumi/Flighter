import 'package:flutter/material.dart';

import 'widgets/change_password_widgets/change_password_body.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ChangePasswordBody()));
  }
}
