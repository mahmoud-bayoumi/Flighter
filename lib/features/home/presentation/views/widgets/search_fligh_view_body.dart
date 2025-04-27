import 'package:flighter/core/utils/functions/captilaize_the_first_three_letters.dart';
import 'package:flighter/core/widgets/failure_page_widget.dart';
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/home/presentation/view_model/airlines_cubit/airlines_cubit.dart';
import 'package:flighter/features/home/presentation/view_model/search_cubit/search_state.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flighter/features/home/presentation/views/widgets/sorting_row.dart';
import 'package:flighter/features/home/presentation/views/widgets/tickets_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/search_cubit/search_cubit.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        // Dynamically calculate the total height for the content
        height: MediaQuery.sizeOf(context).height +
            (BlocProvider.of<SearchCubit>(context).searchModel.data!.length *
                200.h), // Example: Adjust based on ticket size
        child: Stack(
          children: [
            const PrimaryContainer(),
            FromToCountry(
              from: capitalizeFirstThreeLetters(
                      BlocProvider.of<SearchCubit>(context)
                          .searchModel
                          .data![0]
                          .from!) ??
                  'CT1',
              to: capitalizeFirstThreeLetters(
                      BlocProvider.of<SearchCubit>(context)
                          .searchModel
                          .data![0]
                          .to!) ??
                  "CT2",
            ),
            DataOfFlights(
              firstDate: BlocProvider.of<SearchCubit>(context)
                      .searchModel
                      .data![0]
                      .departureDate ??
                  '18/Dec/2024',
              secondDate: BlocProvider.of<SearchCubit>(context)
                      .searchModel
                      .data![0]
                      .arrivalDate ??
                  '--/--/--',
              number:
                  '${BlocProvider.of<SearchCubit>(context).numbersTravelerController.text} Passenger' ??
                      '1 Passenger',
              type: BlocProvider.of<SearchCubit>(context)
                          .classTypeIdController
                          .text ==
                      '1'
                  ? 'Business'
                  : 'Economy',
            ),
            Padding(
              padding: EdgeInsets.only(top: 385.h, left: 15.w),
              child: SortingRow(
                airlines: BlocProvider.of<AirlinesCubit>(context).airlines,
                airlineNames: BlocProvider.of<AirlinesCubit>(context)
                    .airlines
                    .map((airline) => airline.companyName!)
                    .toList(),
                stringBoolMap: {
                  for (var item in BlocProvider.of<AirlinesCubit>(context)
                      .airlines
                      .map((airline) => airline.companyName!)
                      .toList())
                    item: false
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 430.h),
                child: const TicketsListViewBuilder()),
          ],
        ),
      ),
    );
  }
}
