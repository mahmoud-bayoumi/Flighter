// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/base_cubit/date_time_cubit/get_date_time_cubit/get_date_time_cubit.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/bookings/presentation/view_model/get_bookings_cubit/get_bookings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}Future<void> paymentWarningDialog(BuildContext context) async {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: 'Important Notice',
    desc: 'You have 2 minutes to enter your payment details after clicking Pay Now.',
    buttonsTextStyle: Styles.textStyle20.copyWith(color: Colors.white),
    btnOkColor: Colors.red,
    titleTextStyle: Styles.textStyle24,
    descTextStyle: Styles.textStyle16.copyWith(color: kGreyColor),
    padding: const EdgeInsets.all(10),
    btnOk: CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pop(context); // closes dialog and completes the Future
      },
    ),
  ).show(); // this returns a Future, so you can await it
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
      onPressed: () async {
        final now = BlocProvider.of<GetTimeCubit>(context).timeModel;
      //  final todayOnly = DateTime(now.year!, now.month!, now.day!);
        final currentDateTime = DateTime(
          now.year!,
          now.month!,
          now.day!,
          now.hour!,
          now.minute!,
          now.seconds!,
          now.milliSeconds!,
        );
        final scheduledTime = currentDateTime.add(const Duration(seconds: 60));
        final timeZone =
            await AwesomeNotifications().getLocalTimeZoneIdentifier();
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: notificationId,
            channelKey: notChannelKey,
            notificationLayout: NotificationLayout.BigText,
            icon: 'resource://drawable/ic_stat_logo',
            largeIcon: 'asset://assets/images/logo.png',
            backgroundColor: kPrimaryColor,
            body:
                'You have unpaid flight bookings. Please complete your payment to confirm your reservations.',
            wakeUpScreen: true,
            fullScreenIntent: true,
          ),
          schedule: NotificationCalendar(
            year: scheduledTime.year,
            month: scheduledTime.month,
            day: scheduledTime.day,
            hour: scheduledTime.hour,
            minute: scheduledTime.minute,
            second: scheduledTime.second,
            millisecond: scheduledTime.millisecond,
            timeZone: timeZone,
            repeats: false,
            preciseAlarm: true,
          ),
        );
        /*   await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: notificationId,
            channelKey: notChannelKey,
            notificationLayout: NotificationLayout.BigText,
            icon: 'resource://drawable/ic_stat_logo',
            largeIcon: 'asset://assets/images/logo.png',
            backgroundColor: kPrimaryColor,
            body:
                'You have unpaid flight bookings. Please complete your payment to confirm your reservations.',
            wakeUpScreen: true,
            fullScreenIntent: true,
          ),
          schedule: NotificationCalendar(
            year: todayOnly.add(const Duration(days: 2)).year,
            month: todayOnly.add(const Duration(days: 2)).month,
            day: todayOnly.add(const Duration(days: 2)).day,
            hour: 9, // or whatever time you want
            minute: 0,
            second: 0,
            millisecond: 0,
            repeats: true,
          ),
        ); */
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        Navigator.pop(context);
        context.go(AppRouter.kBookingsNavigation);
      },
    ),
  )..show();
}

AwesomeDialog successPaymentDialogFoBookings(
    BuildContext context, String errMessage) {
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
    desc:
        'Your refund has been processed successfully. The amount will be returned to your original payment method.',
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
        BlocProvider.of<GetBookingsCubit>(context).getBookings();
        Navigator.pop(context);
        GoRouter.of(context).pushReplacement(AppRouter.kBookingsNavigation);
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

AwesomeDialog seatsAreBookedAlready(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Unavaiable Booking',
    desc: 'One or more seats already booked! Please try again.',
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
        Navigator.pop(context);
        // GoRouter.of(context).pop();
      },
    ),
  )..show();
}

AwesomeDialog deleteNotAvaiableDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Unavaiable Action',
    desc: 'You can\'t delete your account because you have bookings ticket!',
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

AwesomeDialog refundNotAllowed(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    title: 'Unavaiable Action',
    desc: "Refund not allowed. Booking was made more than 2 days ago.",
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
