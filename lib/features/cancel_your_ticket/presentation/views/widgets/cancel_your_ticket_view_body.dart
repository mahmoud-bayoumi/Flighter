import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/cancel_your_ticket/presentation/views/widgets/cancel_ticket_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cancel_ticket_email_text_form_field.dart';
import 'ticket_number_text_form_field.dart';

class CancelYourTicketViewBody extends StatelessWidget {
  const CancelYourTicketViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Confirm Your Data to Complete Canelation',
              style: Styles.textStyle16
                  .copyWith(color: kGreyColor.withOpacity(0.5)),
            ),
            SizedBox(
              height: 30.h,
            ),
            const CancelTicektEmailTextFormField(),
            SizedBox(
              height: 20.h,
            ),
            const CancelPasswordTextFormField(
              text: 'Password',
            ),
            SizedBox(
              height: 20.h,
            ),
            const TicketNumberTextFormField(
              ticketNumber: '230222-BE143',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: 'Confirm',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
