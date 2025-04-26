import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/styles.dart';

class ProfileTextTitle extends StatelessWidget {
  final String profileTitle;
  const ProfileTextTitle({
    super.key,
    required this.profileTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, top: 20.h, bottom: 35.h),
      child: Text(
        profileTitle,
        style: Styles.textStyle18,
      ),
    );
  }
}
