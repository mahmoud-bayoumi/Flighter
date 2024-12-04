import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordTextFormField({super.key, required this.text, this.controller});
  final String text, hintText = '••••••••';

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
            validator: (value) {
              String patternLowercase = r'(?=.*[a-z])';
              String patternUppercase = r'(?=.*[A-Z])';
              String patternDigit = r'(?=.*\d)';
              String patternSpecialChar = r'(?=.*[!@#$%^&*(),.?":{}|<>])';
              if (value == null || value.isEmpty) {
                return 'This Field is Required';
              }
              if (!RegExp(patternLowercase).hasMatch(value)) {
                return 'Password must contain at least one lowercase letter';
              }
              // Check for uppercase letter
              if (!RegExp(patternUppercase).hasMatch(value)) {
                return 'Password must contain at least one uppercase letter';
              }
              // Check for a digit
              if (!RegExp(patternDigit).hasMatch(value)) {
                return 'Password must contain at least one number';
              }
              // Check for a special character
              if (!RegExp(patternSpecialChar).hasMatch(value)) {
                return 'Password must contain at least one special character';
              }

              return null;
            },
            onChanged: (value) {
              widget.controller!.text = value;
            },
            style: Styles.textStyle18,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  hiddenText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.withOpacity(.8),
                ),
                onPressed: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
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
