// ignore_for_file: use_build_context_synchronously

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/functions/show_snack_bar.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/book_ticket/data/models/seats_model/seats_model.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_state.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/business_list_view.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/economy_list_view.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import '../../../view_model/get_seats_cubit/get_seats_cubit.dart';
import '../../../view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'selection_status_row.dart';

class ChooseSeatViewBody extends StatelessWidget {
  const ChooseSeatViewBody({super.key, required this.seatsModel});
  final SeatsModel seatsModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectionStatusRow(
                  selectionColor: kPrimaryColor,
                  selectionText: 'Selected',
                ),
                SelectionStatusRow(
                  selectionColor: kReservedSeatColor,
                  selectionText: 'Reserved',
                ),
                SelectionStatusRow(
                  selectionColor: kUnavailableColor,
                  selectionText: 'Unavailable',
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocProvider.of<TicketSummaryCubit>(context).isFromOffer
                ? BlocProvider.of<TicketSummaryCubit>(context).offerClassType ==
                        'Business'
                    ? BusinessListVIew(
                        avaiableSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == false)
                            .map<String>((seat) => seat.seatName as String)
                            .toList(),
                        resevedSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == true)
                            .map<String>((seat) => seat.seatName as String)
                            .toList())
                    : EconomyListView(
                        avaiableSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == false)
                            .map<String>((seat) => seat.seatName as String)
                            .toList(),
                        resevedSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == true)
                            .map<String>((seat) => seat.seatName as String)
                            .toList())
                : BlocProvider.of<SearchCubit>(context)
                            .classTypeIdController
                            .text ==
                        '1'
                    ? BusinessListVIew(
                        avaiableSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == false)
                            .map<String>((seat) => seat.seatName as String)
                            .toList(),
                        resevedSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == true)
                            .map<String>((seat) => seat.seatName as String)
                            .toList())
                    : EconomyListView(
                        avaiableSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == false)
                            .map<String>((seat) => seat.seatName as String)
                            .toList(),
                        resevedSeats: seatsModel.data!.seats!
                            .where((seat) => seat.isBooked == true)
                            .map<String>((seat) => seat.seatName as String)
                            .toList()),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: BlocBuilder<TicketSummaryCubit, TicketSummaryState>(
                builder: (context, state) {
                  if (state is TicketSummaryInitial ||
                      state is TicketSummarySuccess) {
                    return CustomButton(
                      text: 'Confirm',
                      height: 70.h,
                      onPressed: () async {
                        if (BlocProvider.of<TicketSummaryCubit>(context)
                            .isFromOffer) {
                          if (BlocProvider.of<TicketSummaryCubit>(context)
                              .selectedSeats
                              .isNotEmpty) {
                            if (BlocProvider.of<TicketSummaryCubit>(context)
                                    .ticketCounter <=
                                seatsModel.data!.seats!
                                    .where((seat) => seat.isBooked == false)
                                    .map<String>(
                                        (seat) => seat.seatName as String)
                                    .toList()
                                    .length) {
                              BlocProvider.of<TicketSummaryCubit>(context)
                                      .noOfTravelers =
                                  BlocProvider.of<TicketSummaryCubit>(context)
                                      .selectedSeats
                                      .length;
                              await BlocProvider.of<TicketSummaryCubit>(context)
                                  .getTicketSummary();
                              for (int i = 0;
                                  i <
                                      BlocProvider.of<GetSeatsCubit>(context)
                                          .seatsModel
                                          .data!
                                          .seats!
                                          .length;
                                  i++) {
                                if (BlocProvider.of<TicketSummaryCubit>(context)
                                    .selectedSeats
                                    .contains(
                                        BlocProvider.of<GetSeatsCubit>(context)
                                            .seatsModel
                                            .data!
                                            .seats![i]
                                            .seatName)) {
                                  if (!BlocProvider.of<PaymentCubit>(context)
                                      .seatsId
                                      .contains(BlocProvider.of<GetSeatsCubit>(
                                              context)
                                          .seatsModel
                                          .data!
                                          .seats![i]
                                          .seatId
                                          .toString())) {
                                    BlocProvider.of<PaymentCubit>(context)
                                        .seatsId
                                        .add(BlocProvider.of<GetSeatsCubit>(
                                                context)
                                            .seatsModel
                                            .data!
                                            .seats![i]
                                            .seatId
                                            .toString());
                                  }
                                }
                              }

                              GoRouter.of(context)
                                  .push(AppRouter.kFlightDetailes);
                             } else {
                              showSnackBar(context,
                                  message:
                                      'Please select at least one seats and you can select up to the number of all available seats before continuing.');
                            }
                          } else {
                            showSnackBar(context,
                                message:
                                    'Please select the seats you wish to book.');
                          }
                        } else {
                          BlocProvider.of<PaymentCubit>(context)
                              .seatsId
                              .clear();
                          if (BlocProvider.of<TicketSummaryCubit>(context)
                              .selectedSeats
                              .isNotEmpty) {
                            if (BlocProvider.of<TicketSummaryCubit>(context)
                                    .ticketCounter ==
                                BlocProvider.of<TicketSummaryCubit>(context)
                                    .noOfTravelers) {
                              await BlocProvider.of<TicketSummaryCubit>(context)
                                  .getTicketSummary();
                              for (int i = 0;
                                  i <
                                      BlocProvider.of<GetSeatsCubit>(context)
                                          .seatsModel
                                          .data!
                                          .seats!
                                          .length;
                                  i++) {
                                if (BlocProvider.of<TicketSummaryCubit>(context)
                                    .selectedSeats
                                    .contains(
                                        BlocProvider.of<GetSeatsCubit>(context)
                                            .seatsModel
                                            .data!
                                            .seats![i]
                                            .seatName)) {
                                  if (!BlocProvider.of<PaymentCubit>(context)
                                      .seatsId
                                      .contains(BlocProvider.of<GetSeatsCubit>(
                                              context)
                                          .seatsModel
                                          .data!
                                          .seats![i]
                                          .seatId
                                          .toString())) {
                                    BlocProvider.of<PaymentCubit>(context)
                                        .seatsId
                                        .add(BlocProvider.of<GetSeatsCubit>(
                                                context)
                                            .seatsModel
                                            .data!
                                            .seats![i]
                                            .seatId
                                            .toString());
                                  }
                                }
                              }

                              GoRouter.of(context)
                                  .push(AppRouter.kFlightDetailes);
                            } else {
                              showSnackBar(context,
                                  message:
                                      'Please select exactly ${BlocProvider.of<TicketSummaryCubit>(context).noOfTravelers} seats before continuing.');
                            }
                          } else {
                            showSnackBar(context,
                                message:
                                    'Please select the seats you wish to book.');
                          }
                          // trigger here
                        }
                      },
                    );
                  } else if (state is TicketSummaryLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }
}
