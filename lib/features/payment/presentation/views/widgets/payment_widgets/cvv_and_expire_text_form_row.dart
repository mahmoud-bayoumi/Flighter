import 'package:flighter/features/payment/presentation/views/widgets/payment_widgets/expire_date_text_form.dart';
import 'package:flutter/material.dart';

class CvvAndExpireTextFormRow extends StatelessWidget {
  const CvvAndExpireTextFormRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
