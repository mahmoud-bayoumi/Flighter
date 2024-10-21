import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: kPrimaryColor,
        minWidth: MediaQuery.sizeOf(context).width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        height: 55.h,
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ));
  }
}
