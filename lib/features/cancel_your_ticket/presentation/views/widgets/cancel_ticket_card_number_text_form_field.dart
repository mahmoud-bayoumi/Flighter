import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';
import '../../../../../core/utils/functions/text_formater.dart';
import '../../../../../core/utils/styles.dart';

class CancelTicketCardNumberTextForm extends StatelessWidget {
  const CancelTicketCardNumberTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Number',
          style: Styles.textStyle22,
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(19),
            FilteringTextInputFormatter.digitsOnly,
            CustomInputFormatter(),
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            hintText: '5300 0000 0000 0000',
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
