// ignore_for_file: use_build_context_synchronously

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_cubit.dart';
import 'package:flighter/core/utils/functions/capitalize_word.dart';
import 'package:flighter/core/utils/functions/captilaize_the_first_three_letters.dart';
import 'package:flighter/core/utils/functions/convert12_hours_format.dart';
import 'package:flighter/core/utils/functions/get_date_only.dart';
import 'package:flighter/core/utils/functions/is_egypt_governament.dart';
import 'package:flighter/core/utils/functions/is_more_than_five_days.dart';
import 'package:flighter/core/utils/functions/is_within_two_days.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flighter/features/bookings/presentation/views/widgets/cancel_ticket_text.dart';
import 'package:flighter/features/integration/eventk_integration/presentation/view_model/get_events_cubit/get_events_cubit.dart';
import 'package:flighter/features/integration/eventk_integration/presentation/view_model/get_events_cubit/get_events_state.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flighter/features/payment/presentation/view_model/refund_cubit/refund_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
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
                      String guestName = bookingData.guestname!;
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
                          '${bookingData.baggageAllowance} ';
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
                    icon: !(isWithin2Days(
                                bookingData.bookingDate!,
                                BlocProvider.of<GetTimeCubit>(context)
                                    .timeModel) &&
                            isMoreThan5DaysFromNow(
                                getDateOnly(
                                  bookingData.departureDate!.toString(),
                                ),
                                BlocProvider.of<GetTimeCubit>(context)
                                    .timeModel))
                        ? const Icon(
                            Icons.download,
                            color: kPrimaryColor,
                            size: 30,
                          )
                        : const SizedBox.shrink())),
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
            isWithin2Days(bookingData.bookingDate!,
                        BlocProvider.of<GetTimeCubit>(context).timeModel) &&
                    isMoreThan5DaysFromNow(
                        getDateOnly(bookingData.departureDate!.toString()),
                        BlocProvider.of<GetTimeCubit>(context).timeModel)
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
                            if (BlocProvider.of<RefundCubit>(context)
                                    .refundModel
                                    .message ==
                                "Refund not allowed. Booking was made more than 2 days ago.") {
                              refundNotAllowed(context);
                            } else {
                              PaymentManager.paymentIntentId =
                                  BlocProvider.of<RefundCubit>(context)
                                      .refundModel
                                      .data!
                                      .paymentintentId!;
                              PaymentManager
                                  .netAmount = BlocProvider.of<RefundCubit>(context)
                                      .refundModel
                                      .data!
                                      .amount!
                                      .contains('E')
                                  ? int.parse(BlocProvider.of<RefundCubit>(context)
                                      .refundModel
                                      .data!
                                      .amount!
                                      .substring(
                                          0,
                                          BlocProvider.of<RefundCubit>(context)
                                                  .refundModel
                                                  .data!
                                                  .amount!
                                                  .length -
                                              1))
                                  : int.parse(BlocProvider.of<RefundCubit>(context)
                                          .refundModel
                                          .data!
                                          .amount!
                                          .substring(0,
                                              BlocProvider.of<RefundCubit>(context).refundModel.data!.amount!.length - 1)) *
                                      egyptianToDollar;
                              bool refunded =
                                  await PaymentManager.refundPayment(
                                      PaymentManager.paymentIntentId,
                                      amount: PaymentManager.netAmount);
                              if (refunded) {
                                refundDoneDialog(context);
                              } else {
                                // After Refund the ticket will be deleted.
                              }
                            }
                          },
                        );
                      },
                    ),
                  )
                : Positioned(
                    top: 580.h,
                    left: isEgyptGovernorate(bookingData.to!)
                        ? 15.w
                        : MediaQuery.sizeOf(context).width / 7.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Recommended :  ',
                          style:
                              Styles.textStyle16.copyWith(color: kPrimaryColor),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.kHotels,
                                  extra: bookingData.to!);
                            },
                            child: Text(
                              'Hotels',
                              style: Styles.textStyle16
                                  .copyWith(color: Colors.white),
                            )),
                        SizedBox(
                          width: 25.w,
                        ),
                        isEgyptGovernorate(bookingData.to!)
                            ? BlocBuilder<GetEventsCubit, GetEventsState>(
                                builder: (context, state) {
                                  if (state is GetEventsLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is GetEventsFailure) {
                                    return Text(
                                      'Error',
                                      style: Styles.textStyle16
                                          .copyWith(color: Colors.red),
                                    );
                                  }
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: kPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () async {
                                        BlocProvider.of<GetEventsCubit>(context)
                                            .toCountry = bookingData.to!;
                                        await BlocProvider.of<GetEventsCubit>(
                                                context)
                                            .getEvents();
                                        GoRouter.of(context)
                                            .push(AppRouter.kEvents);
                                      },
                                      child: Text(
                                        'Events',
                                        style: Styles.textStyle16
                                            .copyWith(color: Colors.white),
                                      ));
                                },
                              )
                            : const SizedBox.shrink(),
                        /*       GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Explore Hotels ',
                              style: Styles.textStyle16
                                  .copyWith(color: kPrimaryColor),
                            )),
                        SizedBox(
                          width: 35.w,
                        ),
                        bookingData.to == 'Egypt'
                            ? GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Explore Events in Egypt',
                                  style: Styles.textStyle16
                                      .copyWith(color: kPrimaryColor),
                                ))
                            : const SizedBox.shrink(), */
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
