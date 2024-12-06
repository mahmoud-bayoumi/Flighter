import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<GetProfilePhotoCubit>();
    var cubitData2 = context.read<GetProfileDataCubit>();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .91,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 30.w, // Spread of the shadow
              offset: const Offset(-10, 6),
            )
          ]),
          child: Stack(children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .19,
            ),
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).width * .075,
              child: BlocBuilder<GetProfilePhotoCubit, GetProfilePhotoState>(
                builder: (context, state) {
                  return ClipOval(
                      child: cubitData.hasImage
                          ? Image.memory(cubitData.imageBits!)
                          : Image.asset(
                              AssetsData.kProfileDefaultImage,
                            ));
                },
              ),
            ),
            Positioned(
                height: MediaQuery.sizeOf(context).width * .25,
                width: MediaQuery.sizeOf(context).width * .285,
                child: const Icon(Icons.remove_circle))
          ]),
        ),
        SizedBox(
          width: 5.w,
        ),
        BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
          builder: (context, state) {
            return Text(
              cubitData2.profileData!.name!,
              style: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            );
          },
        ),
      ]),
    );
  }
}
