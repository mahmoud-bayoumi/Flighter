import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/home/presentation/views/widgets/date_picker_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            dateController:
                BlocProvider.of<SearchCubit>(context).startDateController,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DatePickerTextField(
                isStartDate: true,
                width: 185.w,
                text: 'Start Date',
                dateController:
                    BlocProvider.of<SearchCubit>(context).startDateController,
              ),
              !oneWay
                  ? DatePickerTextField(
                      isStartDate: false,
                      width: 185.w,
                      text: 'End Date',
                      dateController: BlocProvider.of<SearchCubit>(context)
                          .endDateController,
                    )
                  : const SizedBox.shrink(),
            ],
          );
  }
}
