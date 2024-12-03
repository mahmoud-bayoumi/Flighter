import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, this.onPressed, required this.imagePath});
  final void Function()? onPressed;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: kPrimaryColor)),
      child: Image.asset(imagePath),
    );
  }
}
