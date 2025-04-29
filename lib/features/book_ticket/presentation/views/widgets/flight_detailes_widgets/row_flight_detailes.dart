import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/ticket_summary_cubit/ticket_summary_cubit.dart';

class RowFlightDetailes extends StatelessWidget {
  const RowFlightDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlightColumnText(
          text: 'Flight',
          ans: BlocProvider.of<TicketSummaryCubit>(context)
              .ticketSummaryModel
              .data!
              .flightNumber!,
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Gate',
          ans: BlocProvider.of<TicketSummaryCubit>(context)
              .ticketSummaryModel
              .data!
              .gate!,
        ),
        const SizedBox(
          width: 50,
        ),
        FlightColumnText(
          text: 'Seat',
          ans: BlocProvider.of<TicketSummaryCubit>(context)
                      .ticketSummaryModel
                      .data!
                      .selectedSeats
                      .length >
                  1
              ? BlocProvider.of<TicketSummaryCubit>(context)
                      .ticketSummaryModel
                      .data!
                      .selectedSeats[0] +
                  '..'
              : BlocProvider.of<TicketSummaryCubit>(context)
                  .ticketSummaryModel
                  .data!
                  .selectedSeats[0],
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Class',
          ans: BlocProvider.of<TicketSummaryCubit>(context)
              .ticketSummaryModel
              .data!
              .className!,
        ),
      ],
    );
  }
}
