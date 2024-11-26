
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NamewithDivider extends StatelessWidget {
  const NamewithDivider({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Text(
          name,
          style: Styles.textStyle20.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          'Passenger',
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 8.h,
        ),
        Divider(
          thickness: 1,
          color: kGreyColor.withOpacity(.3),
        ),
      ],
    );
  }
}
