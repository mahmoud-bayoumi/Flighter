import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    this.onPressed,
    required this.authDesc,
    required this.authButtonName,
  });
  final void Function()? onPressed;
  final String authDesc, authButtonName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          authDesc,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
        ),
        TextButton(
          style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 5)),
          ),
          onPressed: onPressed,
          child: Text(
            authButtonName,
            style: Styles.textStyle16
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
