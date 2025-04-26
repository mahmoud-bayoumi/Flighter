import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CancelTicketText extends StatelessWidget {
  const CancelTicketText({
    super.key,
    this.onPressed,
    required this.authDesc,
    required this.authButtonName,
    required this.canCancel,
  });
  final void Function()? onPressed;
  final String authDesc, authButtonName;
  final bool canCancel;
  @override
  Widget build(BuildContext context) {
    return canCancel
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                authDesc,
                style:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
              ),
              TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  padding: WidgetStatePropertyAll(EdgeInsets.only(left: 5)),
                ),
                onPressed: onPressed,
                child: Text(
                  authButtonName,
                  style: Styles.textStyle16.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.normal),
                ),
              )
            ],
          )
        : const Text('');
  }
}
