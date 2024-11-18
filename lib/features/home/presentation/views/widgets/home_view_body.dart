import 'package:cached_network_image/cached_network_image.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            color: kPrimaryColor,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * .4,
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h, left: 10.w),
            child: Text(
              'Hello, Yasser',
              style: Styles.textStyle24.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.69,
            child: SizedBox(
              height: 270.h,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.asset(
                  AssetsData.kReversedLogo,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * .2,
            left: MediaQuery.sizeOf(context).height * .035,
            child: Text(
              'Book Your Flight',
              style: Styles.textStyle45,
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * .3,
            left: MediaQuery.sizeOf(context).width * .02,
            right: MediaQuery.sizeOf(context).width * .02,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: SearchContainer(),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * .75,
            left: MediaQuery.sizeOf(context).width * .02,
            child: Text(
              'Hot Deals',
              style: Styles.textStyle35.copyWith(color: kPrimaryColor),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.sizeOf(context).height * .82,
            left: MediaQuery.sizeOf(context).width * .02,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                //      return Image.asset(AssetsData.kLogo);
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBZUcYsjSRCrK_Xk6z-RG2bqvK6i-kd8oICw&s'),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
/*  SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      //      return Image.asset(AssetsData.kLogo);
                      return CachedNetworkImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBZUcYsjSRCrK_Xk6z-RG2bqvK6i-kd8oICw&s');
                    },
                  ),
                ) */