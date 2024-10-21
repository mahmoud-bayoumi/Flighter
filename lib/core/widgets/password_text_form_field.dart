import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
      {super.key, required this.text, required this.hintText});
  final String text, hintText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: Styles.textStyle16.copyWith(color: kGreyColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: const Color(0xffF4EFEF),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon:
                    Icon(hiddenText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
              ),
              hintText: widget.hintText,
              border: customOutlineInputBorder(),
              enabledBorder: customOutlineInputBorder(),
              focusedBorder: customOutlineInputBorder(),
            ),
            obscureText: hiddenText,
          ),
        ),
      ],
    );
  }
}
