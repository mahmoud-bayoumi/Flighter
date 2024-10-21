import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeFormField extends StatelessWidget {
  const CodeFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.h,
      height: 80.h,
      child: TextFormField(
        style: Styles.textStyle25,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          border: customOutlineInputBorder(color: kPrimaryColor),
          enabledBorder: customOutlineInputBorder(color: kGreyColor),
          focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
        ),
      ),
    );
  }
}
