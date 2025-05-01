import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void successDialog(BuildContext context, bool navgToSplash) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent outside tap dismissal
    builder: (BuildContext context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async {
          // Prevent dismissal via the back button
          return false;
        },
        child: AlertDialog(
          title: Text(
            'Successful',
            textAlign: TextAlign.center,
            style: Styles.textStyle24,
          ),
          content: Text(
            'Your password has been changed. Click Continue.',
            textAlign: TextAlign.center,
            style: Styles.textStyle16.copyWith(
              color: kGreyColor,
            ),
          ),
          actions: [
            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.pop(context);
                if (navgToSplash) {
                  GoRouter.of(context).pushReplacement('/');
                } else {
                  GoRouter.of(context).pop();
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

AwesomeDialog changeSaveDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Your data has been changed. Click Continue.',
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
        GoRouter.of(context).pop();
      },
    ),
  )..show();
}

AwesomeDialog deleteProfilePhotoSuccess(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Profile photo deleted successfully.',
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
    desc: 'Payment added successfully.',
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

AwesomeDialog errorDialog(BuildContext context, String errMessage) {
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
        // GoRouter.of(context).pop();
      },
    ),
  )..show();
}

AwesomeDialog errorPaymentDialog(BuildContext context, String errMessage) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Warning',
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
        // GoRouter.of(context).pop();
      },
    ),
  )..show();
}

AwesomeDialog successPaymentDialog(BuildContext context, String errMessage) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Congrats!!',
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
        GoRouter.of(context).pushReplacement(AppRouter.kNavigation);
      },
    ),
  )..show();
}

AwesomeDialog deleteDoneDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Successful',
    desc: 'Account deleted successfully.',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: kPrimaryColor,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Ok',
      onPressed: () {
        GoRouter.of(context).pushReplacement('/');
      },
    ),
  )..show();
}

AwesomeDialog refundDoneDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Refund Success',
    desc: 'Your ticket refunded successfully.',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: kPrimaryColor,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(
      color: kGreyColor,
    ),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Ok',
      onPressed: () {
        GoRouter.of(context).pushReplacement('/');
      },
    ),
  )..show();
}

AwesomeDialog noTicketsAvailable(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Warning',
    desc: 'No Available Tickets',
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
        // GoRouter.of(context).pop();
      },
    ),
  )..show();
}
