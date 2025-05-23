// ignore_for_file: use_build_context_synchronously

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flighter/features/home/data/models/search_model/datum.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flighter/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/capitalize_word.dart';
import '../../../../../core/utils/functions/convert12_hours_format.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key, required this.ticketModel});

  final TicketData ticketModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        BlocProvider.of<GetSeatsCubit>(context).ticketId =
            ticketModel.ticketId ?? 11;
        BlocProvider.of<TicketSummaryCubit>(context).ticketId =
            ticketModel.ticketId ?? 11;
        BlocProvider.of<PaymentCubit>(context).ticketId = ticketModel.ticketId!;

        BlocProvider.of<PaymentCubit>(context).amountToPay =
            int.parse(ticketModel.price!);
        BlocProvider.of<PaymentCubit>(context).noOfTravelers = int.parse(
            BlocProvider.of<SearchCubit>(context)
                .numbersTravelerController
                .text);
        BlocProvider.of<TicketSummaryCubit>(context).noOfTravelers = int.parse(
            BlocProvider.of<SearchCubit>(context)
                .numbersTravelerController
                .text);
        await BlocProvider.of<GetSeatsCubit>(context).getSeats();
        GoRouter.of(context).push(AppRouter.kChooseSeat);
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: kPrimaryColor),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertTo12HourFormat(
                              ticketModel.departureTime ?? '08:30'),
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          capitalizeFirstLetter(ticketModel.from ?? 'CT1'),
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.flight, color: Colors.blue),
                        Text(
                          "${ticketModel.durationInMinutes} mins",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          convertTo12HourFormat(
                              ticketModel.arrivalTime ?? '09:15'),
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          capitalizeFirstLetter(ticketModel.to ?? 'CT2'),
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Image(
              image: AssetImage(AssetsData.kLine),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticketModel.companyName ?? 'IndiGo',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      currency == 'EGP'
                          ? "${ticketModel.price} EGP"
                          : "${int.parse(ticketModel.price!) ~/ egyptianToDollar} USD",
                    style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
