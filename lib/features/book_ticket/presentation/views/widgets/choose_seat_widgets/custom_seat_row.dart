import 'package:flighter/features/book_ticket/presentation/views/widgets/choose_seat_widgets/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSeatsRow extends StatelessWidget {
  final int seatNo;
  final bool seatAReceived, seatBReceived, seatCReceived, seatDReceived;
  const CustomSeatsRow({
    super.key,
    required this.seatNo,
    this.seatAReceived = false,
    this.seatBReceived = false,
    this.seatCReceived = false,
    this.seatDReceived = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Seat(
          seatName: '$seatNo' 'A',
          isReseved: seatAReceived,
        ),
        SizedBox(
          width: 35.w,
        ),
        Seat(seatName: '$seatNo' 'B', isReseved: seatBReceived),
        SizedBox(
          width: 85.w,
        ),
        Seat(seatName: '$seatNo' 'C', isReseved: seatCReceived),
        SizedBox(
          width: 35.w,
        ),
        Seat(seatName: '$seatNo' 'D', isReseved: seatDReceived),
      ],
    );
  }
}
