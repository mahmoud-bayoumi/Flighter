import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_column_text.dart';
import 'package:flutter/material.dart';

class RowFlightDetailesForBookings extends StatelessWidget {
  const RowFlightDetailesForBookings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlightColumnText(
          text: 'Flight',
          ans: '1',
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Gate',
          ans: '22',
        ),
        const SizedBox(
          width: 50,
        ),
        FlightColumnText(
          text: 'Seat',
          ans: '2B',
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Class',
          ans: 'Business',
        ),
      ],
    );
  }
}
