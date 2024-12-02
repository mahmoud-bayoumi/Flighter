
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buisness_seats_row.dart';

class BusinessListVIew extends StatelessWidget {
  const BusinessListVIew({
    super.key,
    required this.resevedSeats,
  });

  final List<String> resevedSeats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: BusinessRow(
              seatNo: index + 1,
              seatAReceived: resevedSeats.contains('${index + 1}A'),
              seatBReceived: resevedSeats.contains('${index + 1}B'),
              seatCReceived: resevedSeats.contains('${index + 1}C'),
              seatDReceived: resevedSeats.contains('${index + 1}D'),
            ));
      },
    );
  }
}
