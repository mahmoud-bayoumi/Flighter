import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;

  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.hintText,
      this.textEditingController});
  final String text, hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle16.copyWith(color: kGreyColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: const Color(0xffF4EFEF),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field is Required';
              }
              return null;
            },
            onChanged: (value) {
              textEditingController!.text = value;
            },
            style: Styles.textStyle18,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
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
