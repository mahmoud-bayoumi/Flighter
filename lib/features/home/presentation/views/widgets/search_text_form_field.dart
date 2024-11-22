import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  final IconData iconData;
  final String text;
  const SearchTextFormField({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: kPrimaryColor),
        prefixIconColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(vertical: 25.h),
        labelText: text,
        prefixIcon: Icon(iconData),
        border: customOutlineInputBorder(color: kPrimaryColor),
        enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
        focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }
}
