
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'seat.dart';

class BusinessRow extends StatelessWidget {
  const BusinessRow({
    super.key,
    required this.seatNo,
    required this.seatAReceived,
    required this.seatBReceived,
    required this.seatCReceived,
    required this.seatDReceived,
  });

  final int seatNo;
  final bool seatAReceived;
  final bool seatBReceived;
  final bool seatCReceived;
  final bool seatDReceived;

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
