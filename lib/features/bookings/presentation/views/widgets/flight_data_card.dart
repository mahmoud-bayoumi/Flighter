// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/capitalize_word.dart';
import 'package:flighter/core/utils/functions/captilaize_the_first_three_letters.dart';
import 'package:flighter/core/utils/functions/convert12_hours_format.dart';
import 'package:flighter/core/utils/functions/get_date_only.dart';
import 'package:flighter/core/utils/functions/is_more_than_five_days.dart';
import 'package:flighter/core/utils/functions/is_within_two_days.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/cancel_ticket_text.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flighter/features/payment/presentation/view_model/refund_cubit/refund_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/functions/dialogs_type.dart';
import '../../../../../core/utils/functions/generate_ticket_pdf.dart';
import '../../../../../core/utils/functions/show_confirmation_dialog.dart';
import '../../../data/models/bookings_model/datum.dart';
import 'row_filght_details_for_bookings.dart';

class FlightDataCardForBookings extends StatelessWidget {
  final BookingData bookingData;
  const FlightDataCardForBookings({super.key, required this.bookingData});

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
                      String bookingDate =
                          getDateOnly(bookingData.bookingDate.toString());
                      String guestName =
                          BlocProvider.of<GetProfileDataCubit>(context)
                              .profileData!
                              .name!
                              .split(' ')[0];
                      String from = capitalizeFirstLetter(bookingData.from!);
                      String to = capitalizeFirstLetter(bookingData.to!);
                      String airline = bookingData.companyName!;
                      String flightNumber = bookingData.flightNumber!;
                      String gate = bookingData.gate!;
                      String departureDate =
                          '${getDateOnly(bookingData.bookingDate.toString())}, ${convertTo12HourFormat(bookingData.departureTime!)}';
                      String arrivalDate =
                          '${bookingData.arrivalDate}, ${convertTo12HourFormat(bookingData.arrivalTime!)}';
                      String duration =
                          '${bookingData.durationInMinutes!} min.';
                      String bookingStatus = bookingData.paymentStatus!;
                      String seatClass = bookingData.className!;
                      String ticketType =
                          bookingData.returnDepartureDate == null
                              ? 'Direct'
                              : 'Round';
                      String ticketCode = bookingData.ticketCode!;
                      String baggageAllowance =
                          '${bookingData.baggageAllowance} KG';
                      String seatNumber = bookingData.selectedSeats!.join(", ");
                      String totalCost = currency == 'EGP'
                          ? '${bookingData.amount / 100} EGP'
                          : '${(bookingData.amount / 100) / egyptianToDollar} USD';
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
                          ticketCode: ticketCode,
                          ticketType: ticketType,
                          returnDepartureDate: ticketType == 'Round'
                              ? bookingData.returnDepartureDate
                              : null,
                          totalCost: totalCost,
                          imageP: bookingData.companyName! == 'Emirates'
                              ? AssetsData.kEmirates
                              : bookingData.companyName! == 'Qatar Airways'
                                  ? AssetsData.kQatar
                                  : bookingData.companyName! == 'Egypt Air'
                                      ? AssetsData.kEgypt
                                      : AssetsData.kKuwait);
                    },
                    icon: const Icon(
                      Icons.download,
                      color: kPrimaryColor,
                      size: 30,
                    ))),
            FromToCountrySecond(
                from: capitalizeFirstThreeLetters(bookingData.from!),
                to: capitalizeFirstThreeLetters(bookingData.to!)),
            Positioned(
              top: 220.h,
              left: 25.w,
              child: UnabledTextField(
                textTitle: 'Date',
                text: bookingData.departureDate.toString(),
                icon: Icons.access_time,
              ),
            ),
            Positioned(
              top: 220.h,
              left: 210.w,
              child: UnabledTextField(
                textTitle: 'Time',
                text:
                    convertTo12HourFormat(bookingData.departureTime.toString()),
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
              left: MediaQuery.sizeOf(context).width / 12,
              child: RowFlightDetailesForBookings(
                bookingData: bookingData,
              ),
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
              left: MediaQuery.sizeOf(context).width / 3.7,
              child: Text(
                capitalizeFirstLetter(bookingData.ticketCode!),
                style: Styles.textStyle45.copyWith(color: Colors.black),
              ),
            ),
            isWithin2Days(bookingData.bookingDate!) &&
                    isMoreThan5DaysFromNow(
                        getDateOnly(bookingData.bookingDate!.toString()))
                ? Positioned(
                    top: 580.h,
                    left: 75.w,
                    child: CancelTicketText(
                      authDesc: 'Cancel ticket if you want?',
                      authButtonName: 'Click Here',
                      canCancel: true,
                      onPressed: () async {
                        showConfirmationDialog(
                          context,
                          () async {
                            BlocProvider.of<RefundCubit>(context).bookingId =
                                bookingData.bookingid!;
                            await BlocProvider.of<RefundCubit>(context)
                                .refundTicket();
                            PaymentManager.paymentIntentId =
                                BlocProvider.of<RefundCubit>(context)
                                    .refundModel
                                    .data!
                                    .paymentintentId!;
                            PaymentManager.netAmount = currency == 'EGP'
                                ? int.parse(
                                    BlocProvider.of<RefundCubit>(context)
                                        .refundModel
                                        .data!
                                        .amount!)
                                : int.parse(
                                        BlocProvider.of<RefundCubit>(context)
                                            .refundModel
                                            .data!
                                            .amount!) *
                                    egyptianToDollar;
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
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
