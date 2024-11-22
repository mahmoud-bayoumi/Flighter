import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CircleAvatarCountry extends StatelessWidget {
  const CircleAvatarCountry({
    super.key,
    required this.county,
  });
  final String county;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 31,
      child: CircleAvatar(
        backgroundColor: kPrimaryColor.withOpacity(.6),
        radius: 30,
        child: Text(
          county,
          style: Styles.textStyle20
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
