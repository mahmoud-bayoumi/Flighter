import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/custom_outline_input_border.dart';
import '../../../../../../core/utils/styles.dart';

class EditProfileDatePicker extends StatefulWidget {
  const EditProfileDatePicker(
      {super.key, required this.width, required this.dateController});
  final TextEditingController dateController;
  final double width;
  @override
  State<EditProfileDatePicker> createState() => _EditProfileDatePickerState();
}

class _EditProfileDatePickerState extends State<EditProfileDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Date of Birth',
            style: Styles.textStyle20,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            onSaved: (newValue) {
              widget.dateController.text = newValue?.substring(0, 10) ?? '';
              widget.dateController.text =
                  widget.dateController.text.substring(0, 10);
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required';
              return null;
            },
            controller: widget.dateController,
            onTap: () {
              _selectDate(context);
            },
            readOnly: true,
            decoration: InputDecoration(
                fillColor: kPrimaryColor,
                hintText: 'Choose your date of birth',
                enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
                focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
                border: customOutlineInputBorder(color: kPrimaryColor)),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
        // Format the date as "YYYY-MM-DD"
        widget.dateController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }
}
