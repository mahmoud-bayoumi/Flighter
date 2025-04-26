import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_column_text.dart';
import 'package:flutter/material.dart';

class RowFlightDetailes extends StatelessWidget {
  const RowFlightDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FlightColumnText(
          text: 'Flight',
          ans: "PK 230",
        ),
        SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Gate',
          ans: "22",
        ),
        SizedBox(
          width: 50,
        ),
        FlightColumnText(
          text: 'Seat',
          ans: "2B",
        ),
        SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Class',
          ans: "Business",
        ),
      ],
    );
  }
}
