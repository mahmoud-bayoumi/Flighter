import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.text, required this.hintText});
  final String text, hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: const Color(0xffF4EFEF),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: customOutlineInputBorder(),
              enabledBorder: customOutlineInputBorder(),
              focusedBorder: customOutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  
}
