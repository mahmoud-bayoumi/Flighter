import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/change_password_widgets/change_password_body.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Set a new password ',
            style: Styles.textStyle27,
          ),
        ),
        body: const SafeArea(child: ChangePasswordBody()));
  }
}
