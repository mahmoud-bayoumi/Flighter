// Usage example:
import 'package:flutter/material.dart';

import '../../widgets/confirmation_dialog.dart';

void showConfirmationDialog(
    BuildContext context, void Function()? onYesPressed) {
  showDialog(
    context: context,
    builder: (context) => ConfirmationDialog(
      title: "Confirm Action",
      content: "Are you sure you want to cancel it?",
      onYesPressed: onYesPressed,
      onNoPressed: () {
        // Perform action when "No" is pressed
      },
    ),
  );
}
