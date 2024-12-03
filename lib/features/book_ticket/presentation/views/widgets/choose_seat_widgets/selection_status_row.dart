import 'package:flutter/material.dart';

class SelectionStatusRow extends StatelessWidget {
  final String selectionText;
  final Color selectionColor;
  const SelectionStatusRow({
    super.key,
    required this.selectionText,
    required this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: selectionColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(selectionText)
      ],
    );
  }
}
