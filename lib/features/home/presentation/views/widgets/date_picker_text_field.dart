import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/custom_outline_input_border.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField(
      {super.key, required this.text, required this.width});
  final String text;
  final double width;
  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) return 'Required';
          return null;
        },
        controller: _dateController,
        onTap: () {
          _selectDate(context);
        },
        readOnly: true,
        decoration: InputDecoration(
            fillColor: kPrimaryColor,
            label: Text(
              widget.text,
              style: const TextStyle(color: kPrimaryColor),
            ),
            prefixIcon: const Icon(
              Icons.calendar_month,
              color: kPrimaryColor,
            ),
            enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
            focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
            border: customOutlineInputBorder(color: kPrimaryColor)),
      ),
    );
  }

  Future<void> _selectDate(dynamic context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: kPrimaryColor,
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: kPrimaryColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
