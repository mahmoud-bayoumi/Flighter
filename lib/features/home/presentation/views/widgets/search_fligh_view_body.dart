import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
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
        Positioned(
          top: MediaQuery.sizeOf(context).height * .4,
          child: Image(
            width: MediaQuery.sizeOf(context).width,
            image: const AssetImage(AssetsData.kTicket),
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .52,
          left: 30,
          child: Text(
            'IndiaGo',
            style: Styles.textStyle20.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .52,
          left: 270,
          child: Text(
            '2.700 EGP',
            style: Styles.textStyle20.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .42,
          left: 270,
          child: Text(
            '09:15 AM',
            style: Styles.textStyle20.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .42,
          left: 30,
          child: Text(
            '08:30 AM',
            style: Styles.textStyle20.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
