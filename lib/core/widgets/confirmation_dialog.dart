
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onYesPressed;
  final VoidCallback? onNoPressed;
  final String yesText;
  final String noText;
  final Color yesColor;
  final Color noColor;
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    this.onYesPressed,
    this.onNoPressed,
    this.yesText = 'Yes',
    this.noText = 'No',
    this.yesColor = Colors.red,
    this.noColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: noColor,
              ),
              onPressed: () {
                Navigator.pop(context);
                onNoPressed?.call();
              },
              child: Text(
                noText,
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yesColor,
              ),
              onPressed: () {
                Navigator.pop(context);
                onYesPressed?.call();
              },
              child: Text(
                yesText,
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
