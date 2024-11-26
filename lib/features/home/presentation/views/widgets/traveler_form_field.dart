import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelerFormField extends StatelessWidget {
  const TravelerFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185.w,
      height: 57.h,
      child: TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
          labelText: '1,Traveler',
          labelStyle: Styles.textStyle17.copyWith(color: kPrimaryColor),
          prefixIconColor: kPrimaryColor,
          prefixIcon: const Icon(Icons.person),
          border: customOutlineInputBorder(color: kPrimaryColor),
          enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
          focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
        ),
      ),
    );
  }
}
