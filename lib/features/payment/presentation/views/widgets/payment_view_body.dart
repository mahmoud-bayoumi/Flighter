import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/custom_small_button.dart';
import 'package:flighter/features/payment/presentation/views/widgets/card_number_text_form.dart';
import 'package:flighter/features/payment/presentation/views/widgets/expire_date_text_form.dart';
import 'package:flighter/features/payment/presentation/views/widgets/title_with_text_form.dart';
import 'package:flighter/features/payment/presentation/views/widgets/types_of_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExpireDateTextForm(
                cvv: true,
                hint: '000',
                title: 'CVV',
              ),
              ExpireDateTextForm(
                cvv: false,
                hint: '05/24',
                title: 'Expiry Date',
              ),
            ],
          ),
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
              Future.delayed(const Duration(seconds: 1), () {});
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomSmallButton(
            minWidth: .7,
            text: 'Cancel',
            blue: false,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
