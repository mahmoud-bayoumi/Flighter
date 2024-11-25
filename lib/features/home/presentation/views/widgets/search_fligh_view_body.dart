
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flighter/features/home/presentation/views/widgets/tickets_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});
  final int flightNumber = 100;
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
              from: 'CHE',
              to: 'BLR',
            ),
            const DataOfFlights(
              firstDate: '26/May/2023',
              secondDate: '23/May/2023',
              number: '1 passenger',
              type: 'First Class',
            ),
            Padding(
                padding: EdgeInsets.only(top: 370.h),
                child: TicketsListViewBuilder(flightNumber: flightNumber)),
          ],
        ),
      ),
    );
  }
}
