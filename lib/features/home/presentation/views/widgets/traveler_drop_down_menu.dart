import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/custom_outline_input_border.dart';

class TravelerDropDownMenu extends StatefulWidget {
  const TravelerDropDownMenu({super.key});

  @override
  State<TravelerDropDownMenu> createState() => _TravelerDropDownMenuState();
}

class _TravelerDropDownMenuState extends State<TravelerDropDownMenu> {
  static const list = ['1', '2', '3', '4', '5'];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185.w,
      child: Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
          enabledBorder: customOutlineInputBorder(color: kPrimaryColor),
          focusedBorder: customOutlineInputBorder(color: kPrimaryColor),
          border: customOutlineInputBorder(color: kPrimaryColor),
        )),
        child: DropdownMenu<String>(
          width: 185.w,
          textStyle: const TextStyle(color: kPrimaryColor),
          leadingIcon: const Icon(
            Icons.airplane_ticket,
            color: kPrimaryColor,
          ),
          label: const Text(
            '1,Traveler',
            style: TextStyle(color: kPrimaryColor),
          ),
          initialSelection: list.first,
          menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onSelected: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              value: value,
              label: value,
            );
          }).toList(),
        ),
      ),
    );
  }
}
