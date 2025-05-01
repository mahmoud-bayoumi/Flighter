import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/is_within_five_days.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/bookings/data/models/bookings_model/datum.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/cancel_ticket_text.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/captilaize_the_first_three_letters.dart';
import '../../../../../core/utils/functions/convert12_hours_format.dart';
import '../../../../../core/utils/functions/dialogs_type.dart';
import '../../../../../core/utils/functions/show_confirmation_dialog.dart';
import '../../../../payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'row_filght_details_for_bookings.dart';

class UnPaidFlightDataCardForBookings extends StatelessWidget {
  final BookingData bookingData;
  const UnPaidFlightDataCardForBookings({super.key, required this.bookingData});

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
              left: 55.w,
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
              left: 75.w,
              child: Text(
                bookingData.ticketCode!,
                style: Styles.textStyle45.copyWith(color: Colors.black),
              ),
            ),
            isWithinFiveDays(bookingData.bookingDate!)
                ? Positioned(
                    top: 580.h,
                    left: 75.w,
                    child: CancelTicketText(
                      authDesc: 'This Ticket is Not Paid!',
                      authButtonName: 'Pay Now',
                      canCancel: true,
                      onPressed: () async {
                        showConfirmationDialog(
                          context,
                          () async {
                            BlocProvider.of<PaymentCubit>(context)
                                    .noOfTravelers =
                                bookingData.selectedSeats!.length;
                                    BlocProvider.of<PaymentCubit>(context)
                                    .amountToPay   ;// amount * no Of Travelers;
                            bool paid = await PaymentManager.makePayment(
                                BlocProvider.of<PaymentCubit>(context)
                                        .noOfTravelers *
                                    BlocProvider.of<PaymentCubit>(context)
                                        .amountToPay,
                                "EGP");
                            if (paid) {
                              BlocProvider.of<PaymentCubit>(context)
                                      .paymentIntentId =
                                  PaymentManager.paymentIntentId;
                              BlocProvider.of<PaymentCubit>(context).isPayNow =
                                  true;
                              BlocProvider.of<PaymentCubit>(context).netAmount =
                                  PaymentManager.netAmount.toString();
                              BlocProvider.of<PaymentCubit>(context).pay();
                              successPaymentDialog(context,
                                  'Your ticket has been added to your bookings.');
                            } else {
                              BlocProvider.of<PaymentCubit>(context).isPayNow =
                                  false;
                              BlocProvider.of<PaymentCubit>(context)
                                  .paymentIntentId = '0';
                              BlocProvider.of<PaymentCubit>(context).netAmount =
                                  '';
                              errorPaymentDialog(
                                  context, 'Payment Not Completed');
                            }
                          },
                        );

                        //   GoRouter.of(context).push(AppRouter.kCancelYourTicket); <-----------------------
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
