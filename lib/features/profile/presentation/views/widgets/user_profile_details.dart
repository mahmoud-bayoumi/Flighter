
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .91,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 30.w, // Spread of the shadow
              offset: const Offset(0, 4),
            )
          ]),
          child: CircleAvatar(
            radius: MediaQuery.sizeOf(context).width * .07,
            child: ClipOval(
                child: Image.asset(
              AssetsData.kProfileDefaultImage,
            )),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'John Smith',
          style: Styles.textStyle18
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),
    );
  }
}
