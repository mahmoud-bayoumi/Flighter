import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TripTypeButton extends StatelessWidget {
  final String tripTypeName;

  final void Function()? onTap;
  final bool oneWay;
  const TripTypeButton({
    super.key,
    required this.tripTypeName,
    this.onTap,
    required this.oneWay,
  });

  @override
  Widget build(BuildContext context) {
    return oneWay
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: Text(
                  tripTypeName,
                  style: Styles.textStyle14.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: Text(
                  tripTypeName,
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                ),
              ),
            ),
          );
  }
}
