import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/features/home/presentation/views/widgets/circle_avatar_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FromToCountry extends StatelessWidget {
  const FromToCountry({super.key, required this.from, required this.to});
  final String from, to;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 90.h,
          left: 30.w,
          child: Image(
            width: 340.w,
            image: const AssetImage(AssetsData.kDistance),
          ),
        ),
        Positioned(
          top: 105.h,
          left: 30.w,
          child: CircleAvatarCountry(
            county: from,
          ),
        ),
        Positioned(
          top: 105.h,
          left: MediaQuery.sizeOf(context).width - 90,
          child: CircleAvatarCountry(
            county: to,
          ),
        ),
        Positioned(
          top: 70.h,
          left: 180.w,
          child: const Image(
            image: AssetImage(AssetsData.kPlane),
          ),
        ),
      ],
    );
  }
}
