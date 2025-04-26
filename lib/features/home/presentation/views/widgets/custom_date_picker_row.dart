import 'package:flighter/features/home/presentation/views/widgets/date_picker_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatePickerRow extends StatelessWidget {
  final bool oneWay;
  const CustomDatePickerRow({super.key, required this.oneWay});

  @override
  Widget build(BuildContext context) {
    return oneWay
        ? DatePickerTextField(
            isStartDate: true,
            width: MediaQuery.sizeOf(context).width,
            text: 'Start Date',
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DatePickerTextField(
                isStartDate: true,
                width: 185.w,
                text: 'Start Date',
              ),
              !oneWay
                  ? DatePickerTextField(
                      isStartDate: false,
                      width: 185.w,
                      text: 'End Date',
                    )
                  : const SizedBox.shrink(),
            ],
          );
  }
}
