import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';
import '../../../../../core/utils/styles.dart';

class TicketNumberTextFormField extends StatelessWidget {
  final String ticketNumber;
  const TicketNumberTextFormField({
    super.key,
    required this.ticketNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Ticekt Number',
            style: Styles.textStyle20,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 15,
              bottom: 15,
            ),
            hintText: ticketNumber,
            hintStyle: Styles.textStyle18.copyWith(color: Colors.black),
            border:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            enabledBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            focusedBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
            disabledBorder:
                customOutlineInputBorder(color: kGreyColor.withOpacity(0.5)),
          ),
        )
      ],
    );
  }
}
