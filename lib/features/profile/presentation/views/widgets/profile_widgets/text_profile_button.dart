import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextProfileButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const TextProfileButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, bottom: 30.h),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          buttonText,
          style: Styles.textStyle18.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
