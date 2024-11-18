
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TripTypeButton extends StatelessWidget {
  final String tripTypeName;
  const TripTypeButton({
    super.key,
    required this.tripTypeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(26)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
        child: Text(
          tripTypeName,
          style: Styles.textStyle14,
        ),
      ),
    );
  }
}
