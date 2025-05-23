import 'package:flighter/core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/get_seats_cubit/get_seats_state.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/choose_seat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../core/widgets/no_internet_connect.dart';

class ChooseSeatView extends StatelessWidget {
  const ChooseSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    BlocProvider.of<TicketSummaryCubit>(context).ticketCounter =
                        0;
                    BlocProvider.of<TicketSummaryCubit>(context).selectedSeats =
                        [];
                    GoRouter.of(context).pop();
                  },
                ),
                centerTitle: true,
                title: Text(
                  'Choose Seat',
                  style: Styles.textStyle24,
                ),
              ),
              body: BlocBuilder<GetSeatsCubit, GetSeatsState>(
                builder: (context, state) {
                  return ChooseSeatViewBody(
                    seatsModel:
                        BlocProvider.of<GetSeatsCubit>(context).seatsModel,
                  );
                },
              ));
        }
      },
    );
  }
}
