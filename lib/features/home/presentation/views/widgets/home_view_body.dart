

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/failure_page_widget.dart';
import 'package:flighter/core/widgets/primary_container.dart';
import 'package:flighter/features/home/presentation/views/widgets/hot_deals_list_view.dart';
import 'package:flighter/features/home/presentation/views/widgets/search_container.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/capitalize_word.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var getData = context.read<GetProfileDataCubit>();
    getData.getProfile();
    var getProfilePhotoCubit = context.read<GetProfilePhotoCubit>();
    getProfilePhotoCubit.getProfilePhoto();

    return BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
      builder: (context, state) {
        if (state is GetProfileDataLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else if (state is GetProfileDataFailure) {
          return const FailurePageWidget();
        } else {
          final userName = getData.profileData?.name ?? 'Guest';
       
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                ),
                const PrimaryContainer(),
                Padding(
                  padding: EdgeInsets.only(top: 45.h, left: 10.w),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      'Hello, ${capitalizeFirstLetter(userName.split(' ')[0])}',
                      style: Styles.textStyle24.copyWith(color: Colors.white),
                    ),
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
                    child: const SearchContainer(),
                  ),
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * .86,
                  left: MediaQuery.sizeOf(context).width * .04,
                  child: Text(
                    'Hot Deals',
                    style: Styles.textStyle35.copyWith(color: kPrimaryColor),
                  ),
                ),
                Positioned.fill(
                  top: MediaQuery.sizeOf(context).height * 0.92,
                  left: MediaQuery.sizeOf(context).width * .02,
                  child: const HotDealsListView(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

/*
         CachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBZUcYsjSRCrK_Xk6z-RG2bqvK6i-kd8oICw&s'),
            )
            */

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
