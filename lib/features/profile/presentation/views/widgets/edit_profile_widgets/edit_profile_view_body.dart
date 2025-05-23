import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';

import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flighter/features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/edit_profile_widgets/edit_profile_date_picker.dart';
import 'package:flighter/features/profile/presentation/views/widgets/edit_profile_widgets/edit_profile_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/functions/dialogs_type.dart';
import 'country_auto_complete_drop_down.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<GetProfileDataCubit>();
    var updateCubit = context.read<UpdateProfileCubit>();

    updateCubit.name.text = cubitData.profileData!.name!;
    updateCubit.dateOfBirth.text =
        cubitData.profileData!.dateOfBirth?.substring(0, 10) ?? '';
    updateCubit.country.text = cubitData.profileData!.country ?? 'Egypt';

    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          var getProfilePhoto = context.read<GetProfilePhotoCubit>();
          getProfilePhoto.getProfilePhoto();
          var getProfileData = context.read<GetProfileDataCubit>();
          getProfileData.getProfile();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const EditProfileImagePicker(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: Styles.textStyle20,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      onSaved: (newValue) {
                        updateCubit.name.text = newValue!;
                      },
                      controller: updateCubit.name,
                      decoration: InputDecoration(
                        hintText: 'Enter your name here',
                        border: customOutlineInputBorder(color: kPrimaryColor),
                        enabledBorder:
                            customOutlineInputBorder(color: kPrimaryColor),
                        focusedBorder:
                            customOutlineInputBorder(color: kPrimaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    EditProfileDatePicker(
                      width: MediaQuery.sizeOf(context).width,
                      dateController: updateCubit.dateOfBirth,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CountryAutocompleteDropdown(
                      countryController: updateCubit.country,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 65.h,
                      width: 300.w,
                      child: CustomButton(
                        text: 'Save Changes',
                        onPressed: () async {
                           updateCubit.updateProfile();

                          context
                              .read<GetProfilePhotoCubit>()
                              .getProfilePhoto();
                          cubitData.getProfile();

                          EasyLoading.show(status: 'Loading...');
                          await Future.delayed(
                              const Duration(milliseconds: 1950));
                          EasyLoading.dismiss();
                          // ignore: use_build_context_synchronously
                          changeSaveDialog(context);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
