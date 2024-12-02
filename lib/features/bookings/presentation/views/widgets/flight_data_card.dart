import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/row_flight_detailes.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/cancel_ticket_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/generate_ticket_pdf.dart';

class FlightDataCard extends StatelessWidget {
  const FlightDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 3,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Stack(
          children: [
            Positioned(
                top: 10.h,
                left: MediaQuery.sizeOf(context).width * 0.829,
                child: IconButton(
                    onPressed: () async {
                      const String bookingDate = 'Saturday, December 3, 2022';
                      const String guestName = 'Miss Stephanie Celine Linden';
                      const String from = 'New York';
                      const String to = 'London';
                      const String airline = 'ACME Airlines';
                      const String flightNumber = '230222-BE143';
                      const String gate = '22';
                      const String departureDate = '7 June 06:25 AM';
                      const String arrivalDate = '7 June 09:30 AM';
                      const String duration = '03:05';
                      const String bookingStatus = 'Confirmed';
                      const String seatClass = 'Economy Class';
                      const String baggageAllowance = '8 KG';
                      const String seatNumber = '2B';
                      await generateTicketPDF(
                        bookingDate: bookingDate,
                        guestName: guestName,
                        from: from,
                        to: to,
                        airline: airline,
                        flightNumber: flightNumber,
                        gate: gate,
                        departureDate: departureDate,
                        arrivalDate: arrivalDate,
                        bookingStatus: bookingStatus,
                        duration: duration,
                        seatClass: seatClass,
                        baggageAllowance: baggageAllowance,
                        seatNumber: seatNumber,
                      );
                    },
                    icon: const Icon(
                      Icons.download,
                      color: kPrimaryColor,
                      size: 30,
                    ))),
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
              top: 310.h,
              left: 25.w,
              child: Divider(
                indent: 10.w,
                endIndent: 75.w,
                thickness: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            Positioned(
              top: 360.h,
              left: 55.w,
              child: const RowFlightDetailes(),
            ),
            Positioned(
              top: 460.h,
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
              left: 75.w,
              child: Text(
                '230222-BE143',
                style: Styles.textStyle45.copyWith(color: Colors.black),
              ),
            ),
            Positioned(
              top: 580.h,
              left: 75.w,
              child: CancelTicketText(
                authDesc: 'Cancel ticket if possible?',
                authButtonName: 'Click Here',
                canCancel: true,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kCancelYourTicket);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
