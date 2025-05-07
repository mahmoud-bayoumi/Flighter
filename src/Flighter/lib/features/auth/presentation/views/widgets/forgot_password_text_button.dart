import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: const ButtonStyle(
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onPressed,
        child: Text(
          'Forgot Password?',
          style: Styles.textStyle17,
        ),
      ),
    );
  }
}
