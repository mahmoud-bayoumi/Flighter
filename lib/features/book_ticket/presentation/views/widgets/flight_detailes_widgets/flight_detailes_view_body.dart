// ignore_for_file: use_build_context_synchronously

import 'package:awesome_notifications/awesome_notifications.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/functions/is_more_than_five_days.dart';

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
        isMoreThan5DaysFromNow(
                BlocProvider.of<TicketSummaryCubit>(context).isFromOffer
                    ? BlocProvider.of<TicketSummaryCubit>(context).depatureDate!
                    : BlocProvider.of<SearchCubit>(context)
                        .startDateController
                        .text)
            ? Positioned(
                top: 730.h,
                left: 25.w,
                child: CustomSmallButton(
                  onPressed: () async {
                    await BlocProvider.of<GetSeatsCubit>(context).getSeats();
                    if (BlocProvider.of<GetSeatsCubit>(context)
                        .seatsModel
                        .data!
                        .seats!
                        .where((seat) => seat.isBooked == true)
                        .map<int>((seat) => seat.seatId as int)
                        .toList()
                        .any(BlocProvider.of<PaymentCubit>(context)
                            .seatsId
                            .contains)) {
                      BlocProvider.of<PaymentCubit>(context).seatsId = [];
                      seatsAreBookedAlready(context);
                    } else {
                      BlocProvider.of<PaymentCubit>(context).isPayNow = false;
                      BlocProvider.of<PaymentCubit>(context).paymentIntentId =
                          '0';
                      BlocProvider.of<PaymentCubit>(context).netAmount = '0';
                      await BlocProvider.of<PaymentCubit>(context).pay();
                    }
                    successPaymentDialog(context,
                        'Your ticket has been added to your bookings.');
                    AwesomeNotifications().createNotification(
                      content: NotificationContent(
                        id: notificationId,
                        channelKey: notChannelKey,
                        notificationLayout: NotificationLayout.BigText,
                        icon: 'resource://drawable/ic_stat_logo',
                        largeIcon: 'asset://assets/images/logo.png',
                        backgroundColor: kPrimaryColor,
                        body:
                            'You have unpaid flight bookings. Please complete your payment to confirm your reservations.',
                        wakeUpScreen: true,
                        fullScreenIntent: true,
                      ),
                      schedule: NotificationCalendar(
                        year: DateTime.now().add(const Duration(days: 2)).year,
                        month:
                            DateTime.now().add(const Duration(days: 2)).month,
                        day: DateTime.now().add(const Duration(days: 2)).day,
                        hour: 9, // or whatever time you want
                        minute: 0,
                        second: 0,
                        millisecond: 0,
                        repeats: true,
                      ),
                    );
                  },
                  text: 'Pay Later',
                  blue: false,
                ),
              )
            : const SizedBox.shrink(),
        Positioned(
          top: 730.h,
          left: !isMoreThan5DaysFromNow(
                  BlocProvider.of<TicketSummaryCubit>(context).isFromOffer
                      ? BlocProvider.of<TicketSummaryCubit>(context)
                          .depatureDate!
                      : BlocProvider.of<SearchCubit>(context)
                          .startDateController
                          .text)
              ? MediaQuery.sizeOf(context).width / 3.2
              : 210.w,
          child: CustomSmallButton(
            onPressed: () async {
              if (!BlocProvider.of<PaymentCubit>(context).clickedForPay) {
                BlocProvider.of<PaymentCubit>(context).clickedForPay = true;
                await flightDeatilsViewBodyLogic(context);
              } else {
                BlocProvider.of<PaymentCubit>(context).clickedForPay = false;
              }
            },
            text: 'Pay Now',
            blue: true,
          ),
        ),
      ],
    );
  }

  Future<void> flightDeatilsViewBodyLogic(BuildContext context) async {
    await BlocProvider.of<GetSeatsCubit>(context).getSeats();
    if (BlocProvider.of<GetSeatsCubit>(context)
        .seatsModel
        .data!
        .seats!
        .where((seat) => seat.isBooked == true)
        .map<int>((seat) => seat.seatId as int)
        .toList()
        .any(BlocProvider.of<PaymentCubit>(context).seatsId.contains)) {
      BlocProvider.of<PaymentCubit>(context).seatsId = [];
      seatsAreBookedAlready(context);
    } else {
      if (currency == 'EGP') {
        BlocProvider.of<PaymentCubit>(context).amountToPay =
            BlocProvider.of<PaymentCubit>(context).amountToPay;
      } else {
        BlocProvider.of<PaymentCubit>(context).amountToPay =
            BlocProvider.of<PaymentCubit>(context).amountToPay ~/
                egyptianToDollar;
      }

      bool paid = await PaymentManager.makePayment(
          BlocProvider.of<PaymentCubit>(context).noOfTravelers *
              BlocProvider.of<PaymentCubit>(context).amountToPay,
          currency == 'EGP' ? "EGP" : "USD");
      if (paid) {
        BlocProvider.of<PaymentCubit>(context).paymentIntentId =
            PaymentManager.paymentIntentId;
        BlocProvider.of<PaymentCubit>(context).isPayNow = true;
        BlocProvider.of<PaymentCubit>(context).netAmount = currency == 'EGP'
            ? PaymentManager.netAmount.toString()
            : (PaymentManager.netAmount * egyptianToDollar).toString();
        await BlocProvider.of<PaymentCubit>(context).pay();
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        successPaymentDialog(
            context, 'Your ticket has been added to your bookings.');
      } else {
        BlocProvider.of<PaymentCubit>(context).isPayNow = false;
        BlocProvider.of<PaymentCubit>(context).paymentIntentId = '0';
        BlocProvider.of<PaymentCubit>(context).netAmount = '';
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        errorPaymentDialog(context, 'Payment Not Completed');
      }
    }
  }
}

// check if available for later
