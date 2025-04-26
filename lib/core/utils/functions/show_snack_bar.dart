import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      backgroundColor: kPrimaryColor,
      content: Text(
        message,
        style: Styles.textStyle16,
      )));
}
