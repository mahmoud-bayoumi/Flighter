import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';
import '../../../../../core/utils/styles.dart';

class CancelTicektEmailTextFormField extends StatelessWidget {
  const CancelTicektEmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: Styles.textStyle20,
          ),
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
            hintText: 'ex:email@gmail.com',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            border:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            enabledBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            focusedBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
          ),
        )
      ],
    );
  }
}
