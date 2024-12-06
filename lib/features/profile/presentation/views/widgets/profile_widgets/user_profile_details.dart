import 'package:flighter/core/utils/assets_data.dart';
import 'package:flighter/core/utils/functions/capitalize_word.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_profile_photo_cubit/delete_profile_photo_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/functions/dialogs_type.dart';
import '../../../view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<GetProfilePhotoCubit>();
    var cubitData2 = context.read<GetProfileDataCubit>();

    String name = capitalizeFirstLetter(cubitData2.profileData!.name!);
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
          child: BlocConsumer<DeleteProfilePhotoCubit, DeleteProfilePhotoState>(
            listener: (context, state) {
              if (state is DeleteProfilePhotoFailure) {
                EasyLoading.dismiss();
                errorDialog(context, state.errMessage);
              } else if (state is DeleteProfilePhotoLoading) {
                EasyLoading.show(status: 'Loading...'); 
              } else if (state is DeleteProfilePhotoSuccess) {
                EasyLoading.dismiss();
                deleteProfilePhotoSuccess(context);
                cubitData.clearProfilePhoto();
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .19,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.sizeOf(context).width * .075,
                    child:
                        BlocBuilder<GetProfilePhotoCubit, GetProfilePhotoState>(
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
                    child: GestureDetector(
                        onTap: () {
                          var deleteProfilePhoto =
                              context.read<DeleteProfilePhotoCubit>();
                          deleteProfilePhoto.deleteProfilePhoto();
                        },
                        child: const Icon(Icons.remove_circle)),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
          builder: (context, state) {
            return Text(
              name,
              style: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            );
          },
        ),
      ]),
    );
  }
}
