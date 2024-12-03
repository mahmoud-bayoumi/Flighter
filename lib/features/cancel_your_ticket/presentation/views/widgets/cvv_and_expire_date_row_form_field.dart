import 'package:flutter/material.dart';

import 'cvv_text_form_field.dart';

class CvvAndExpireDateRowFormField extends StatelessWidget {
  const CvvAndExpireDateRowFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CvvTextFormField(cvv: true, hint: '000', title: 'CVV'),
        CvvTextFormField(cvv: false, hint: '05/24', title: 'Expire Date'),
      ],
    );
  }
}
