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
    required this.seatAAvaiable,
    required this.seatBAvaiable,
    required this.seatCAvaiable,
    required this.seatDAvaiable,
  });

  final int seatNo;
  final bool seatAReceived;
  final bool seatBReceived;
  final bool seatCReceived;
  final bool seatDReceived;
  final bool seatAAvaiable;
  final bool seatBAvaiable;
  final bool seatCAvaiable;
  final bool seatDAvaiable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Seat(
          isAvaiable: seatAAvaiable,
          seatName: '$seatNo' 'A',
          isReseved: seatAReceived,
        ),
        SizedBox(
          width: 35.w,
        ),
        Seat(
            isAvaiable: seatBAvaiable,
            seatName: '$seatNo' 'B',
            isReseved: seatBReceived),
        SizedBox(
          width: 85.w,
        ),
        Seat(
            isAvaiable: seatCAvaiable,
            seatName: '$seatNo' 'C',
            isReseved: seatCReceived),
        SizedBox(
          width: 35.w,
        ),
        Seat(
            isAvaiable: seatDAvaiable,
            seatName: '$seatNo' 'D',
            isReseved: seatDReceived),
      ],
    );
  }
}
