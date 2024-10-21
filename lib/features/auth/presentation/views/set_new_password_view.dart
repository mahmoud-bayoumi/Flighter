import 'package:flighter/features/auth/presentation/views/widgets/set_new_password_view_body.dart';
import 'package:flutter/material.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: SetNewPasswordBody(),
      ),
    );
  }
}

