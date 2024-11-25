import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileViewListTile extends StatelessWidget {
  const ProfileViewListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: ListTile(
        leading: const Icon(
          Icons.person_2_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: Styles.textStyle25.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
