import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/card_data.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kPrimaryColor,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .4,
        ),
        const FromToCountry(
          from: 'CHE',
          to: 'BLR',
        ),
        Positioned(
          top: 190.h,
          left: 10.w,
          child: const CardData(
            text: '26/May/2023',
            icon: Icons.date_range,
          ),
        ),
        Positioned(
          top: 190.h,
          left: 220.w,
          child: const CardData(
            text: '23/May/2023',
            icon: Icons.date_range,
          ),
        ),
        Positioned(
          top: 250.h,
          left: 10.w,
          child: const CardData(
            text: 'First Class',
            icon: Icons.date_range,
          ),
        ),
        Positioned(
          top: 250.h,
          left: 250.w,
          child: const CardData(
            text: '26/May/2023',
            icon: Icons.date_range,
          ),
        )
      ],
    );
  }
}
