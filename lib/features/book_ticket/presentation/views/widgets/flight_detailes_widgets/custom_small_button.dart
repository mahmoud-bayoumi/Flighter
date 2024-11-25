import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.text,
    required this.blue,
    this.onPressed,
  });
  final String text;
  final bool blue;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return blue
        ? MaterialButton(
            color: kPrimaryColor,
            minWidth: MediaQuery.sizeOf(context).width * .42,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            onPressed: onPressed,
            child: Text(
              text,
              style: Styles.textStyle24
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        : MaterialButton(
            color: Colors.white,
            minWidth: MediaQuery.sizeOf(context).width * .42,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: kPrimaryColor),
            ),
            height: 50,
            onPressed: onPressed,
            child: Text(
              text,
              style: Styles.textStyle24
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          );
  }
}
