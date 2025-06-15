// ignore_for_file: use_build_context_synchronously

import 'package:flighter/core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_state.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/core/widgets/custom_small_button.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_detailes_card.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flighter/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_cubit.dart';
import '../../../../../../core/utils/functions/is_more_than_five_days.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../payment/presentation/view_model/pay_later_booking_cubit/pay_later_booking_cubit.dart';

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
        ((BlocProvider.of<TicketSummaryCubit>(context).isFromOffer
                    ? isMoreThan5DaysFromNow(
                        BlocProvider.of<TicketSummaryCubit>(context)
                                .depatureDate ??
                            '',
                        BlocProvider.of<GetTimeCubit>(context).timeModel)
                    : isMoreThan5DaysFromNow(
                        BlocProvider.of<SearchCubit>(context)
                            .startDateController
                            .text,
                        BlocProvider.of<GetTimeCubit>(context).timeModel)) ==
                true)
            ? BlocBuilder<GetTimeCubit, GetTimeState>(
                builder: (context, state) {
                  if(state is GetTimeFailure) {
                    return Center(
                      child: Text(
                        'Network Error',
                        style: Styles.textStyle22,
                      ),
                    );
                  } else if (state is GetTimeSuccess) {
                                   return Positioned(
                    top: 730.h,
                    left: 25.w,
                    child: CustomSmallButton(
                      onPressed: () async {
                        BlocProvider.of<PaymentCubit>(context).isPayNow = false;
                        BlocProvider.of<PaymentCubit>(context).paymentIntentId =
                            '0';
                        BlocProvider.of<PaymentCubit>(context).netAmount = '0';
                        EasyLoading.show(status: 'loading...');
                        await BlocProvider.of<PaymentCubit>(context).pay();
                        if (BlocProvider.of<PaymentCubit>(context)
                                .payNowModel
                                .message ==
                            'One or more selected seats are already booked') {
                          BlocProvider.of<PaymentCubit>(context).seatsId = [];
                          BlocProvider.of<PaymentCubit>(context).noOfTravelers =
                              0;
                          await BlocProvider.of<GetSeatsCubit>(context)
                              .getSeats();
                          seatsAreBookedAlready(context);
                        } else {
                          BlocProvider.of<TicketSummaryCubit>(context)
                              .ticketCounter = 0;
                          BlocProvider.of<TicketSummaryCubit>(context)
                              .selectedSeats = [];
                          EasyLoading.dismiss();

                          successPaymentDialog(context,
                              'Your ticket has been added to your bookings.');
                        }
                      },
                      text: 'Pay Later',
                      blue: false,
                    ),
                  );
                  }
                  return Positioned(
                    top: 730.h,
                    left: 25.w,
                    child: CustomSmallButton(
                      onPressed: () async {
                        BlocProvider.of<PaymentCubit>(context).isPayNow = false;
                        BlocProvider.of<PaymentCubit>(context).paymentIntentId =
                            '0';
                        BlocProvider.of<PaymentCubit>(context).netAmount = '0';
                        EasyLoading.show(status: 'loading...');
                        await BlocProvider.of<PaymentCubit>(context).pay();
                        if (BlocProvider.of<PaymentCubit>(context)
                                .payNowModel
                                .message ==
                            'One or more selected seats are already booked') {
                          BlocProvider.of<PaymentCubit>(context).seatsId = [];
                          BlocProvider.of<PaymentCubit>(context).noOfTravelers =
                              0;
                          await BlocProvider.of<GetSeatsCubit>(context)
                              .getSeats();
                          seatsAreBookedAlready(context);
                        } else {
                          BlocProvider.of<TicketSummaryCubit>(context)
                              .ticketCounter = 0;
                          BlocProvider.of<TicketSummaryCubit>(context)
                              .selectedSeats = [];
                          EasyLoading.dismiss();
                            
                          successPaymentDialog(context,
                              'Your ticket has been added to your bookings.');
                        }
                      },
                      text: 'Pay Later',
                      blue: false,
                    ),
                  );
                },
              )
            : const SizedBox.shrink(),
        BlocBuilder<GetTimeCubit, GetTimeState>(
          builder: (context, state) {
            if (state is GetTimeFailure) {
              return Center(
                child: Text(
                  'Network Error',
                  style: Styles.textStyle22,
                ),
              );
            } else if (state is GetTimeSuccess) {
              return Positioned(
                top: 730.h,
                left: (isMoreThan5DaysFromNow(
                            BlocProvider.of<TicketSummaryCubit>(context)
                                    .isFromOffer
                                ? BlocProvider.of<TicketSummaryCubit>(context)
                                    .depatureDate!
                                : BlocProvider.of<SearchCubit>(context)
                                    .startDateController
                                    .text,
                            BlocProvider.of<GetTimeCubit>(context).timeModel) ==
                        false)
                    ? MediaQuery.sizeOf(context).width / 3.2
                    : 210.w,
                child: CustomSmallButton(
                  onPressed: () async {
                    if (!BlocProvider.of<PaymentCubit>(context).clickedForPay) {
                      BlocProvider.of<PaymentCubit>(context).clickedForPay =
                          true;
                      EasyLoading.show(status: 'loading...');

                      await flightDeatilsViewBodyLogic(context);
                      BlocProvider.of<TicketSummaryCubit>(context)
                          .ticketCounter = 0;
                      BlocProvider.of<TicketSummaryCubit>(context)
                          .selectedSeats = [];
                    }
                  },
                  text: 'Pay Now',
                  blue: true,
                ),
              );
            }
            return Positioned(
              top: 730.h,
              left: (isMoreThan5DaysFromNow(
                          BlocProvider.of<TicketSummaryCubit>(context)
                                  .isFromOffer
                              ? BlocProvider.of<TicketSummaryCubit>(context)
                                  .depatureDate!
                              : BlocProvider.of<SearchCubit>(context)
                                  .startDateController
                                  .text,
                          BlocProvider.of<GetTimeCubit>(context).timeModel) ==
                      false)
                  ? MediaQuery.sizeOf(context).width / 3.2
                  : 210.w,
              child: CustomSmallButton(
                onPressed: () async {
                  if (!BlocProvider.of<PaymentCubit>(context).clickedForPay) {
                    BlocProvider.of<PaymentCubit>(context).clickedForPay = true;
                    EasyLoading.show(status: 'loading...');

                    await flightDeatilsViewBodyLogic(context);
                    BlocProvider.of<TicketSummaryCubit>(context).ticketCounter =
                        0;
                    BlocProvider.of<TicketSummaryCubit>(context).selectedSeats =
                        [];
                  }
                },
                text: 'Pay Now',
                blue: true,
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> flightDeatilsViewBodyLogic(BuildContext context) async {
    await BlocProvider.of<GetSeatsCubit>(context).getSeats();

    if (currency == 'EGP') {
      BlocProvider.of<PaymentCubit>(context).amountToPay =
          BlocProvider.of<PaymentCubit>(context).amountToPay;
    } else {
      BlocProvider.of<PaymentCubit>(context).amountToPay =
          BlocProvider.of<PaymentCubit>(context).amountToPay ~/
              egyptianToDollar;
    }
    EasyLoading.dismiss();
    BlocProvider.of<PaymentCubit>(context).isPayNow = true;
    await BlocProvider.of<PaymentCubit>(context).pay();
    if (BlocProvider.of<PaymentCubit>(context).payNowModel.message ==
        'One or more selected seats are already booked') {
      BlocProvider.of<PaymentCubit>(context).seatsId = [];
      BlocProvider.of<PaymentCubit>(context).noOfTravelers = 0;
      await BlocProvider.of<GetSeatsCubit>(context).getSeats();
      seatsAreBookedAlready(context);
    } else {
      bool paid = await PaymentManager.makePayment(
          BlocProvider.of<PaymentCubit>(context).noOfTravelers *
              BlocProvider.of<PaymentCubit>(context).amountToPay,
          currency == 'EGP' ? "EGP" : "USD");
      if (paid) {
        BlocProvider.of<PaymentCubit>(context).paymentIntentId =
            PaymentManager.paymentIntentId;

        BlocProvider.of<PayLaterBookingCubit>(context).bookingId =
            BlocProvider.of<PaymentCubit>(context).payNowModel.data;
        BlocProvider.of<PayLaterBookingCubit>(context).amount =
            currency == 'EGP'
                ? '${BlocProvider.of<PaymentCubit>(context).amountToPay}E'
                : '${BlocProvider.of<PaymentCubit>(context).amountToPay}U';

        BlocProvider.of<PayLaterBookingCubit>(context).paymentIntentId =
            PaymentManager.paymentIntentId;
        BlocProvider.of<PaymentCubit>(context).clickedForPay = false;
        BlocProvider.of<PayLaterBookingCubit>(context).payLaterBooking();
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        BlocProvider.of<PaymentCubit>(context).clickedForPay = false;
        successPaymentDialog(
            context, 'Your ticket has been added to your bookings.');
      } else {
        BlocProvider.of<PaymentCubit>(context).isPayNow = false;
        BlocProvider.of<PaymentCubit>(context).paymentIntentId = '0';
        BlocProvider.of<PaymentCubit>(context).netAmount = '';
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        BlocProvider.of<PaymentCubit>(context).clickedForPay = false;
        errorPaymentDialog(context, 'Payment Not Completed');
      }
    }
  }
}

// check if available for later
