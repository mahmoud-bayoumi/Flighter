import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/data_of_flights.dart';
import 'package:flighter/features/home/presentation/views/widgets/from_to_counter.dart';
import 'package:flutter/material.dart';

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
      ],
    );
  }
}
