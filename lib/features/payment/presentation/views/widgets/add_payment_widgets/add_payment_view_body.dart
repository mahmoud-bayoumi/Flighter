import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/custom_small_button.dart';
import 'package:flighter/features/payment/presentation/views/widgets/payment_widgets/card_number_text_form.dart';
import 'package:flighter/features/payment/presentation/views/widgets/payment_widgets/cvv_and_expire_text_form_row.dart';
import 'package:flighter/features/payment/presentation/views/widgets/payment_widgets/title_with_text_form.dart';
import 'package:flighter/features/payment/presentation/views/widgets/payment_widgets/types_of_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPaymentViewBody extends StatelessWidget {
  const AddPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            const CardNumberTextForm(),
            SizedBox(
              height: 30.h,
            ),
            const TitleWithTextForm(),
            SizedBox(
              height: 30.h,
            ),
            const CvvAndExpireTextFormRow(),
            SizedBox(
              height: 30.h,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: TypesOfPayments(),
            ),
            SizedBox(
              height: 75.h,
            ),
            CustomSmallButton(
              minWidth: .7,
              text: 'Confirm',
              blue: true,
              onPressed: () {
                paymentDoneDialog(context);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
