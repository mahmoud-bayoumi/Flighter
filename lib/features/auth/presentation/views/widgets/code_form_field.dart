import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeFormField extends StatelessWidget {
  const CodeFormField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.h,
      height: 110.h,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: Styles.textStyle25,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '_',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          counterText: '',
          border: customOutlineInputBorder(color: kPrimaryColor),
          enabledBorder: customOutlineInputBorder(color: kGreyColor),
          focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
        ),
      ),
    );
  }
}
