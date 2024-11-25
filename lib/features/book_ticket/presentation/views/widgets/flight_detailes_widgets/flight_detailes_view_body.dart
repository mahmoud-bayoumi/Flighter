import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/custom_small_button.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/row_flight_detailes.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
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
        Container(
          color: kPrimaryColor,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .4,
        ),
        Positioned(
          left: 4.w,
          right: 4.w,
          top: MediaQuery.sizeOf(context).height * .06,
          child: Card(
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
                  const FromToCountrySecond(from: "CHE", to: "BLG"),
                  Positioned(
                    top: 220.h,
                    left: 25.w,
                    child: const UnabledTextField(
                      text: '06/07/2023',
                      icon: Icons.access_time,
                    ),
                  ),
                  Positioned(
                    top: 220.h,
                    left: 210.w,
                    child: const UnabledTextField(
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
