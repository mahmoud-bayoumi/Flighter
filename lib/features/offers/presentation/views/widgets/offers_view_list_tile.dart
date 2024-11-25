import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OffersViewListTile extends StatelessWidget {
  const OffersViewListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: ListTile(
        leading: const Icon(
          Icons.celebration_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Offers',
          style: Styles.textStyle25.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
