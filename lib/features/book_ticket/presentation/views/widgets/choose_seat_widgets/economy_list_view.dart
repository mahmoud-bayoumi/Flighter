
import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/economy_seats_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EconomyListView extends StatelessWidget {
  const EconomyListView(
      {super.key, required this.resevedSeats, required this.avaiableSeats});
  final List<String> resevedSeats;
  final List<String> avaiableSeats;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: EconomySeatsRow(
              seatNo: index + 1,
              seatEReceived: resevedSeats.contains('${index + 1}E'),
              seatFReceived: resevedSeats.contains('${index + 1}F'),
              seatGReceived: resevedSeats.contains('${index + 1}G'),
              seatHReceived: resevedSeats.contains('${index + 1}H'),
              seatEAvaiable: avaiableSeats.contains('${index + 1}E'),
              seatFAvaiable: avaiableSeats.contains('${index + 1}F'),
              seatGAvaiable: avaiableSeats.contains('${index + 1}G'),
              seatHAvaiable: avaiableSeats.contains('${index + 1}H'),
            ));
      },
    );
  }
}
