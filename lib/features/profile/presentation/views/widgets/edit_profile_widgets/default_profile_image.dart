import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/assets_data.dart';

class DefualtProfileImage extends StatelessWidget {
  const DefualtProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<GetProfilePhotoCubit>();
    return Stack(children: [
      BlocBuilder<GetProfilePhotoCubit, GetProfilePhotoState>(
        builder: (context, state) {
          return CircleAvatar(
            radius: MediaQuery.sizeOf(context).width * .15,
            child: state is GetProfilePhotoLoading
                ? const CircularProgressIndicator(
                    color: kPrimaryColor,
                  )
                : ClipOval(
                    child: cubitData.hasImage && state is GetProfilePhotoSuccess
                        ? Image.memory(
                            cubitData.imageBits!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            AssetsData.kProfileDefaultImage,
                          )),
          );
        },
      ),
      Positioned(
        left: 92.w,
        top: 105.h,
        child: const Icon(
          Icons.add_a_photo,
          color: kPrimaryColor,
        ),
      )
    ]);
  }
}
