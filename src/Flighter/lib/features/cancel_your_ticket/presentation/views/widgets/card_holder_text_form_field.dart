import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';

class CardHolderTextFormField extends StatelessWidget {
  const CardHolderTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Holder Name',
          style: Styles.textStyle22,
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 15,
              bottom: 15,
            ),
            hintText: 'First Last',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            focusedBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            enabledBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}
