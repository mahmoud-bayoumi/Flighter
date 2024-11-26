import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/text_formater.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpireDateTextForm extends StatelessWidget {
  const ExpireDateTextForm({
    super.key,
    required this.cvv,
    required this.hint,
    required this.title,
  });
  final bool cvv;
  final String hint, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle22,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .35,
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: cvv
                ? [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                    ExpireDateFormater(),
                  ],
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
