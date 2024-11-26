import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/custom_outline_input_border.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/profile/presentation/views/widgets/edit_profile_widgets/edit_profile_date_picker.dart';
import 'package:flighter/features/profile/presentation/views/widgets/edit_profile_widgets/edit_profile_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'country_auto_complete_drop_down.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                EditProfileDatePicker(width: MediaQuery.sizeOf(context).width),
                SizedBox(
                  height: 20.h,
                ),
                const CountryAutocompleteDropdown(),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                  height: 65.h,
                  width: 300.w,
                  child: const CustomButton(text: 'Save Changes'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
