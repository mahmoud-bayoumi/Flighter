import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flighter/features/home/presentation/views/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFligthViewBody extends StatelessWidget {
  const SearchFligthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TicketWidget(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
