import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';

class ProfilePrimaryContainer extends StatelessWidget {
  const ProfilePrimaryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .4,
    );
  }
}
