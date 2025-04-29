import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/bookins_list_tile.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/flight_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingsViewBody extends StatelessWidget {
  const BookingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PrimaryContainer(),
        Positioned(
          left: MediaQuery.sizeOf(context).width * .01,
          top: MediaQuery.sizeOf(context).height * 0.05,
          child: const BookingListTile(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 2.w),
                child: const FlightDataCardForBookings(),
              );
            },
          ),
        ),
      ],
    );
  }
}
