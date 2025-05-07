import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardData extends StatelessWidget {
  const CardData({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: Card(
        color: Colors.white.withOpacity(.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: ListTile(
          textColor: kPrimaryColor,
          iconColor: kPrimaryColor,
          titleTextStyle: Styles.textStyle17.copyWith(color: kPrimaryColor),
          leading: Icon(
            icon,
            size: 25.sp,
          ),
          title: Text(
            text,
            style: Styles.textStyle16,
          ),
        ),
      ),
    );
  }
}
