import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_button.dart';
import 'custom_seat_row.dart';
import 'selection_status_row.dart';

class ChooseSeatViewBody extends StatelessWidget {
  const ChooseSeatViewBody({super.key});
  final List<String> resevedSeats = const ['5A', '5B', '5C', '5D', '1A'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectionStatusRow(
                  selectionColor: kPrimaryColor,
                  selectionText: 'Selected',
                ),
                SelectionStatusRow(
                  selectionColor: kReservedSeatColor,
                  selectionText: 'Reserved',
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.h),
                    child: CustomSeatsRow(
                      seatNo: index + 1,
                      seatAReceived: resevedSeats.contains('${index + 1}A'),
                      seatBReceived: resevedSeats.contains('${index + 1}B'),
                      seatCReceived: resevedSeats.contains('${index + 1}C'),
                      seatDReceived: resevedSeats.contains('${index + 1}D'),
                    ));
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomButton(
                text: 'Confirm',
                height: 90.h,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }
}
