import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';

class PrimaryContainer extends StatelessWidget {
  final double height;
  const PrimaryContainer({
    super.key,
    this.height = .4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * height,
    );
  }
}
