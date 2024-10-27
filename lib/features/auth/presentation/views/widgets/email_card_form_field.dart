import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EmailCardFormField extends StatelessWidget {
  const EmailCardFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is Required';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20,
          ),
          border: customOutlineInputBorder(),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey.withOpacity(.9999),
          ),
          hintText: 'Enter your email address',
          hintStyle:
              Styles.textStyle16.copyWith(color: Colors.grey.withOpacity(.8)),
        ),
      ),
    );
  }
}
