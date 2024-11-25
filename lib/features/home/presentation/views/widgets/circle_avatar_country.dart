import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CircleAvatarCountry extends StatelessWidget {
  const CircleAvatarCountry({
    super.key,
    required this.county,
    required this.light,
  });
  final String county;
  final bool light;
  @override
  Widget build(BuildContext context) {
    return light
        ? CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 31,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Text(
                county,
                style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            ),
          )
        : CircleAvatar(
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
