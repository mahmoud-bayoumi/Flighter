import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flighter/features/home/presentation/views/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});
  final int flightNumber = 7;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        // Dynamically calculate the total height for the content
        height: MediaQuery.sizeOf(context).height +
            (flightNumber * 180.h), // Example: Adjust based on ticket size
        child: Stack(
          children: [
            Container(
              color: kPrimaryColor,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .4,
            ),
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
            Positioned(
              top: 380.h,
              right: 1.w,
              left: 2.w,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: flightNumber,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TicketWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
