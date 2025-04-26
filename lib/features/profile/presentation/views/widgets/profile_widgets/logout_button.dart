import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final void Function()? onPressed;
  const LogoutButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ));
  }
}
