import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

AwesomeDialog successDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Your password has been changed. Click Continue to login',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: kPrimaryColor,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  )..show();
}

AwesomeDialog paymentDoneDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Payment done successfully.',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: kPrimaryColor,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  )..show();
}

AwesomeDialog addPaymentDoneDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Payment done successfully.',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: kPrimaryColor,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    btnOkOnPress: () {
      Navigator.pop(context);
    },
    padding: const EdgeInsets.all(10),
  )..show();
}

AwesomeDialog errorDialog(BuildContext context , String errMessage) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Error',
    desc: errMessage,
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: Colors.red,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  )..show();
}
