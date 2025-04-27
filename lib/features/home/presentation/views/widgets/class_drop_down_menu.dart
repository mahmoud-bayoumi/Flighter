import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';

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
    if (dropdownValue == 'Business') {
      BlocProvider.of<SearchCubit>(context).classTypeIdController.text = '1';
    } else {
      BlocProvider.of<SearchCubit>(context).classTypeIdController.text = '2';
    }
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
            Icons.flight_class,
            color: kPrimaryColor,
          ),
          label: const Text(
            'Class',
            style: TextStyle(color: kPrimaryColor),
          ),
          initialSelection: list.first,
          menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onSelected: (String? value) {
            setState(() {
              dropdownValue = value!;
              if (dropdownValue == 'Business') {
                BlocProvider.of<SearchCubit>(context)
                    .classTypeIdController
                    .text = '1';
              } else {
                BlocProvider.of<SearchCubit>(context)
                    .classTypeIdController
                    .text = '2';
              }
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
