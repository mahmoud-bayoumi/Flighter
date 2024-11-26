

import 'package:flighter/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypesOfPayments extends StatelessWidget {
  const TypesOfPayments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          fit: BoxFit.fill,
          width: 30.w,
          height: 35.h,
          image: const AssetImage(
            AssetsData.kMasterCard,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Image(
          fit: BoxFit.fill,
          width: 55.w,
          height: 55.h,
          image: const AssetImage(
            AssetsData.kVisa,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Image(
          fit: BoxFit.fill,
          width: 55.w,
          height: 55.h,
          image: const AssetImage(
            AssetsData.kPayPal,
          ),
        ),
      ],
    );
  }
}