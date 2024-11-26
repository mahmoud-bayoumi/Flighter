import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TitleWithTextForm extends StatelessWidget {
  const TitleWithTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Holder Name',
          style: Styles.textStyle22,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .8,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'First Last',
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
