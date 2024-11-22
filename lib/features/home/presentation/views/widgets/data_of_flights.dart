import 'package:flighter/features/home/presentation/views/widgets/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataOfFlights extends StatelessWidget {
  const DataOfFlights(
      {super.key,
      required this.firstDate,
      required this.secondDate,
      required this.number,
      required this.type});
  final String firstDate, secondDate, number, type;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 190.h,
          left: 10.w,
          child: CardData(
            text: firstDate,
            icon: Icons.date_range,
          ),
        ),
        Positioned(
          top: 190.h,
          left: 220.w,
          child: CardData(
            text: secondDate,
            icon: Icons.date_range,
          ),
        ),
        Positioned(
          top: 280.h,
          left: 10.w,
          child: CardData(
            text: number,
            icon: Icons.person,
          ),
        ),
        Positioned(
          top: 280.h,
          left: 220.w,
          child: CardData(
            text: type,
            icon: Icons.flight_class,
          ),
        )
      ],
    );
  }
}
