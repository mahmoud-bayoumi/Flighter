import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'seat.dart';

class EconomySeatsRow extends StatelessWidget {
  const EconomySeatsRow({
    super.key,
    required this.seatNo,
    required this.seatEReceived,
    required this.seatFReceived,
    required this.seatGReceived,
    required this.seatHReceived,
  });

  final int seatNo;
  final bool seatEReceived;
  final bool seatFReceived;
  final bool seatGReceived;
  final bool seatHReceived;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Seat(
          seatName: '$seatNo' 'E',
          isReseved: seatEReceived,
        ),
        SizedBox(
          width: 35.w,
        ),
        Seat(seatName: '$seatNo' 'F', isReseved: seatFReceived),
        SizedBox(
          width: 85.w,
        ),
        Seat(seatName: '$seatNo' 'G', isReseved: seatGReceived),
        SizedBox(
          width: 35.w,
        ),
        Seat(seatName: '$seatNo' 'H', isReseved: seatHReceived),
      ],
    );
  }
}
