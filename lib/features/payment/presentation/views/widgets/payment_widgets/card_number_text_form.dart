import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/text_formater.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberTextForm extends StatelessWidget {
  const CardNumberTextForm({
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
          width: MediaQuery.sizeOf(context).width * .8,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(19),
              FilteringTextInputFormatter.digitsOnly,
              CustomInputFormatter(),
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: '',
              hintText: '5300 0000 0000 0000',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
