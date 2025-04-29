import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/captilaize_the_first_three_letters.dart';
import 'package:flighter/core/utils/functions/convert12HoursFormat.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/book_ticket/presentation/view_model/ticket_summary_cubit/ticket_summary_cubit.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/from_to_country_second.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/row_flight_detailes.dart';
import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/unabled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightDetailesCard extends StatelessWidget {
  const FlightDetailesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 3,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * .67,
            child: Stack(
              children: [
                FromToCountrySecond(
                    from: capitalizeFirstThreeLetters(
                        BlocProvider.of<TicketSummaryCubit>(context)
                            .ticketSummaryModel
                            .data!
                            .from!),
                    to: capitalizeFirstThreeLetters(
                        BlocProvider.of<TicketSummaryCubit>(context)
                            .ticketSummaryModel
                            .data!
                            .to!)),
                Positioned(
                  top: 220.h,
                  left: 25.w,
                  child: UnabledTextField(
                    textTitle: 'Date',
                    text: BlocProvider.of<TicketSummaryCubit>(context)
                        .ticketSummaryModel
                        .data!
                        .departureDate!,
                    icon: Icons.access_time,
                  ),
                ),
                Positioned(
                  top: 220.h,
                  left: 210.w,
                  child: UnabledTextField(
                    textTitle: 'Time',
                    text: convertTo12HourFormat(
                        BlocProvider.of<TicketSummaryCubit>(context)
                            .ticketSummaryModel
                            .data!
                            .departureTime!),
                    icon: Icons.access_time,
                  ),
                ),
                Positioned(
                  top: 310.h,
                  left: MediaQuery.sizeOf(context).width * .065,
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
                  top: 350.h,
                  left: MediaQuery.sizeOf(context).width * .15,
                  child: const RowFlightDetailes(),
                ),
                Positioned(
                  top: 450.h,
                  left: MediaQuery.sizeOf(context).width * .065,
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
                  left: MediaQuery.sizeOf(context).width * .17,
                  child: Center(
                    child: Text(
                      BlocProvider.of<TicketSummaryCubit>(context)
                          .ticketSummaryModel
                          .data!
                          .ticketCode!,
                      style: Styles.textStyle45.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
