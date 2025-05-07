import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/text_formater.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';

class CvvTextFormField extends StatelessWidget {
  const CvvTextFormField({
    super.key,
    required this.cvv,
    required this.hint,
    required this.title,
  });
  final bool cvv;
  final String hint, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle22,
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .35,
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: cvv
                ? [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                    ExpireDateFormater(),
                  ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 15,
                bottom: 15,
              ),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              focusedBorder:
                  customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
              enabledBorder:
                  customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
