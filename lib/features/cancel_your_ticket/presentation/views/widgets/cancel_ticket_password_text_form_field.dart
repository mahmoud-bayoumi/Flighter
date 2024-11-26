import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';
import '../../../../../core/utils/styles.dart';

class CancelPasswordTextFormField extends StatefulWidget {
  const CancelPasswordTextFormField({super.key, required this.text});
  final String text, hintText = '••••••••';

  @override
  State<CancelPasswordTextFormField> createState() =>
      _CancelPasswordTextFormFieldState();
}

class _CancelPasswordTextFormFieldState
    extends State<CancelPasswordTextFormField> {
  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: Styles.textStyle20,
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Required';
            }
            return null;
          },
          style: Styles.textStyle18,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 15,
              bottom: 15,
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
            border:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            enabledBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            focusedBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
          ),
          obscureText: hiddenText,
        ),
      ],
    );
  }
}
