import 'package:flighter/features/book_ticket/presentation/views/widgets/flight_detailes_widgets/flight_column_text.dart';
import 'package:flutter/material.dart';

import '../../../data/models/bookings_model/datum.dart';

class RowFlightDetailesForBookings extends StatelessWidget {
  const RowFlightDetailesForBookings({
    super.key,
    required this.bookingData,
  });
  final BookingData bookingData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlightColumnText(
          text: 'Flight',
          ans: bookingData.flightNumber!,
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Gate',
          ans: bookingData.gate!,
        ),
        const SizedBox(
          width: 50,
        ),
        FlightColumnText(
          text: 'Seat',
          ans: bookingData.selectedSeats!.length > 1
              ? '${bookingData.selectedSeats![0]}..'
              : bookingData.selectedSeats![0],
        ),
        const SizedBox(
          width: 30,
        ),
        FlightColumnText(
          text: 'Class',
          ans: bookingData.className!,
        ),
      ],
    );
  }
}
