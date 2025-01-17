import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EmailCardFormField extends StatelessWidget {
  const EmailCardFormField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.198),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is Required';
          }
          if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
              .hasMatch(value)) {
            return 'Invalid email format';
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
