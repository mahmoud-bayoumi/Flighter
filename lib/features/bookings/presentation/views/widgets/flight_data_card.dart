import 'dart:developer';

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/cancel_ticket_text.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/dialogs_type.dart';
import '../../../../../core/utils/functions/generate_ticket_pdf.dart';
import '../../../../../core/utils/functions/show_confirmation_dialog.dart';
import 'row_filght_details_for_bookings.dart';

class FlightDataCardForBookings extends StatelessWidget {
  const FlightDataCardForBookings({super.key});

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
                      const String bookingDate = 'Saturday, December 18, 2024';
                      const String guestName = 'Jon Smith';
                      const String from = 'Cairo';
                      const String to = 'Alexanderia';
                      const String airline = 'Cario Airlines';
                      const String flightNumber = '230222-BE143';
                      const String gate = '22';
                      const String departureDate = '18 Dec 08:30 AM';
                      const String arrivalDate = '18 Dec 09:30 AM';
                      const String duration = '00:45';
                      const String bookingStatus = 'Confirmed';
                      const String seatClass = 'Buisness Class';
                      const String baggageAllowance = '8 KG';
                      const String seatNumber = '2B';
                      const String totalCost = '2500 EGP';
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
                          totalCost: totalCost);
                    },
                    icon: const Icon(
                      Icons.download,
                      color: kPrimaryColor,
                      size: 30,
                    ))),
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
              child: const RowFlightDetailesForBookings(),
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
                onPressed: () async {
                  showConfirmationDialog(
                    context,
                    () async {
                      bool refunded = await PaymentManager.refundPayment(
                          PaymentManager.paymentIntentId,
                          amount: PaymentManager.netAmount);
                      if (refunded) {
                        refundDoneDialog(context);
                        log('Refundedddddddddddddddddddddddddddddddddddddddddddddd Done');
                      } else {
                        // After Refund the ticket will be deleted.
                        log('Refundedddddddddddddddddddddddddddddddddddddddddddddd XXXXX');
                      }
                    },
                  );

                  //   GoRouter.of(context).push(AppRouter.kCancelYourTicket); <-----------------------
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
