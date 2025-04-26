import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class NoInternetConnectionView extends StatelessWidget {
  const NoInternetConnectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            color: kPrimaryColor,
            size: MediaQuery.sizeOf(context).width * 0.37,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .025,
          ),
          Text(
            'No Internet Connection',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .015,
          ),
          Text(
            'No Internet Connection found. Check your connection or try again!',
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
