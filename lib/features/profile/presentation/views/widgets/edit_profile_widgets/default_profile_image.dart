import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets_data.dart';

class DefualtProfileImage extends StatelessWidget {
  const DefualtProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: MediaQuery.sizeOf(context).width * .15,
        child: ClipOval(
            child: Image.asset(
          AssetsData.kProfileDefaultImage,
        )),
      ),
      Positioned(
        left: 92.w,
        top: 110.h,
        child: const Icon(
          Icons.add_a_photo,
          color: kPrimaryColor,
        ),
      )
    ]);
  }
}
