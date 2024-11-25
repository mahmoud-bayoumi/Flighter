import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/custom_small_button.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_detailes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightDetailesViewBody extends StatelessWidget {
  const FlightDetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
        ),
        const PrimaryContainer(),
        Positioned(
          left: 4.w,
          right: 4.w,
          top: MediaQuery.sizeOf(context).height * .06,
          child: const FlightDetailesCard(),
        ),
        Positioned(
          top: 730.h,
          left: 25.w,
          child: CustomSmallButton(
            onPressed: () {},
            text: 'Cancel',
            blue: false,
          ),
        ),
        Positioned(
          top: 730.h,
          left: 210.w,
          child: CustomSmallButton(
            onPressed: () {},
            text: 'Continue',
            blue: true,
          ),
        ),
      ],
    );
  }
}
