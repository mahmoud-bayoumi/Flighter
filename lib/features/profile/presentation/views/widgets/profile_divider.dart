
import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Divider(
        endIndent: MediaQuery.sizeOf(context).width * 0.04,
        color: kGreyColor.withOpacity(0.5),
        thickness: 0.7,
      ),
    );
  }
}