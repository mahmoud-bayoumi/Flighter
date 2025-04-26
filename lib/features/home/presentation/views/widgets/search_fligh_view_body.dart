import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/home/presentation/view_model/airlines_cubit/airlines_cubit.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flighter/features/home/presentation/views/widgets/sorting_row.dart';
import 'package:flighter/features/home/presentation/views/widgets/tickets_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});
  final int flightNumber = 4;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        // Dynamically calculate the total height for the content
        height: MediaQuery.sizeOf(context).height +
            (flightNumber * 200.h), // Example: Adjust based on ticket size
        child: Stack(
          children: [
            const PrimaryContainer(),
            const FromToCountry(
              from: 'CAI',
              to: 'ALX',
            ),
            const DataOfFlights(
              firstDate: '18/Dec/2024',
              secondDate: '20/Dec/2024',
              number: '1 passenger',
              type: 'Business',
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
                child: TicketsListViewBuilder(flightNumber: flightNumber)),
          ],
        ),
      ),
    );
  }
}
