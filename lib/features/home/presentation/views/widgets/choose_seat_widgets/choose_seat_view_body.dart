import 'package:flighter/constants.dart';
import 'package:flighter/features/home/presentation/views/widgets/choose_seat_widgets/selection_status_row.dart';
import 'package:flutter/material.dart';

class ChooseSeatViewBody extends StatelessWidget {
  const ChooseSeatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectionStatusRow(
              selectionColor: kPrimaryColor,
              selectionText: 'Selected',
            ),
            SelectionStatusRow(
              selectionColor: Color(0xff7C7270),
              selectionText: 'Reserved',
            ),
          ],
        )
      ],
    );
  }
}
