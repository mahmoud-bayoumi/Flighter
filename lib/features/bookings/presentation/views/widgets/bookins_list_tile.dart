import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookingListTile extends StatelessWidget {
  const BookingListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: ListTile(
        leading: const Icon(
          Icons.event_note_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Bookings',
          style: Styles.textStyle25.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
