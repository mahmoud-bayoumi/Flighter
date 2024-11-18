
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDropDownMenu extends StatefulWidget {
  const ClassDropDownMenu({super.key});

  @override
  State<ClassDropDownMenu> createState() => _ClassDropDownMenuState();
}

class _ClassDropDownMenuState extends State<ClassDropDownMenu> {
  static const list = ['Economy', 'Business'];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: DropdownMenu<String>(
        leadingIcon: const Icon(Icons.flight_class),
        label: const Text('Class'),
        initialSelection: list.first,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
