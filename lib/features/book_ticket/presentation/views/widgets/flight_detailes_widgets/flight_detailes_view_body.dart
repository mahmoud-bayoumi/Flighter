import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/core/widgets/custom_small_button.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_detailes_card.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import 'package:flighter/features/payment/data/payment_manager.dart';
import 'package:flighter/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_router.dart';

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
        Positioned(
          top: 730.h,
          left: 25.w,
          child: CustomSmallButton(
            onPressed: () async {
              BlocProvider.of<GetSeatsCubit>(context).getSeats();
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
                BlocProvider.of<PaymentCubit>(context).paymentIntentId = '0';
                BlocProvider.of<PaymentCubit>(context).netAmount = '0';
                BlocProvider.of<PaymentCubit>(context).pay();
              }
              successPaymentDialog(
                  context, 'Your ticket has been added to your bookings.');

              GoRouter.of(context)
                  .pushReplacement(AppRouter.kBookingsNavigation);
            },
            text: 'Pay Later',
            blue: false,
          ),
        ),
        Positioned(
          top: 730.h,
          left: 210.w,
          child: CustomSmallButton(
            onPressed: () async {
              BlocProvider.of<GetSeatsCubit>(context).getSeats();
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
                bool paid = await PaymentManager.makePayment(
                    BlocProvider.of<PaymentCubit>(context).noOfTravelers *
                        BlocProvider.of<PaymentCubit>(context).amountToPay,
                    "EGP");
                if (paid) {
                  BlocProvider.of<PaymentCubit>(context).paymentIntentId =
                      PaymentManager.paymentIntentId;
                  BlocProvider.of<PaymentCubit>(context).isPayNow = true;
                  BlocProvider.of<PaymentCubit>(context).netAmount =
                      PaymentManager.netAmount.toString();
                  BlocProvider.of<PaymentCubit>(context).pay();
                  BlocProvider.of<GetBookingsCubit>(context).getBookings();
                  successPaymentDialog(
                      context, 'Your ticket has been added to your bookings.');
                } else {
                  BlocProvider.of<PaymentCubit>(context).isPayNow = false;
                  BlocProvider.of<PaymentCubit>(context).paymentIntentId = '0';
                  BlocProvider.of<PaymentCubit>(context).netAmount = '';
                  errorPaymentDialog(context, 'Payment Not Completed');
                }
              }
            },
            text: 'Pay Now',
            blue: true,
          ),
        ),
      ],
    );
  }
}

// check if available for later
