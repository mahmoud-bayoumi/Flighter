import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';

class DatePickerTextField extends StatefulWidget {
  final TextEditingController dateController;

  const DatePickerTextField(
      {super.key,
      required this.text,
      required this.width,
      required this.isStartDate,
      required this.dateController});
  final String text;
  final double width;
  final bool isStartDate;
  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  late String formattedDate, endFormattedDate;
  @override
  void initState() {
    super.initState();
    DateTime defaultStartDate = DateTime.now();
    DateTime defaultEndDate = defaultStartDate.add(const Duration(days: 3));
    String formattedDate =
        "${defaultStartDate.year}-${defaultStartDate.month.toString().padLeft(2, '0')}-${defaultStartDate.day.toString().padLeft(2, '0')}";
    String endFormattedDate =
        "${defaultEndDate.year}-${defaultEndDate.month.toString().padLeft(2, '0')}-${defaultEndDate.day.toString().padLeft(2, '0')}";

    // Set the formatted date to the controller
    /* widget.dateController.text =
        widget.isStartDate ? formattedDate : endFormattedDate;*/
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
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
      firstDate: DateTime.now(),
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
    if (!mounted) return;
    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
