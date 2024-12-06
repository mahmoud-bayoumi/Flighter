import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/row_flight_detailes.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightDetailesCard extends StatelessWidget {
  const FlightDetailesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 3,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * .67,
            child: Stack(
              children: [
                const FromToCountrySecond(from: "CAI", to: "ALX"),
                Positioned(
                  top: 220.h,
                  left: 25.w,
                  child: const UnabledTextField(
                    textTitle: 'Date',
                    text: '18/12/2024',
                    icon: Icons.access_time,
                  ),
                ),
                Positioned(
                  top: 220.h,
                  left: 210.w,
                  child: const UnabledTextField(
                    textTitle: 'Time',
                    text: '9:30 AM',
                    icon: Icons.access_time,
                  ),
                ),
                Positioned(
                  top: 310.h,
                  left: 25.w,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Divider(
                      indent: 10.w,
                      endIndent: 75.w,
                      thickness: 1,
                      color: kGreyColor.withOpacity(.4),
                    ),
                  ),
                ),
                Positioned(
                  top: 350.h,
                  left: 30.w,
                  child: const RowFlightDetailes(),
                ),
                Positioned(
                  top: 450.h,
                  left: 25.w,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Divider(
                      indent: 10.w,
                      endIndent: 75.w,
                      thickness: 1,
                      color: kGreyColor.withOpacity(.4),
                    ),
                  ),
                ),
                Positioned(
                  top: 500.h,
                  left: 40.w,
                  child: Text(
                    '230222-BE143',
                    style: Styles.textStyle45.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
