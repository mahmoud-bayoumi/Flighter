import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.text});
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
