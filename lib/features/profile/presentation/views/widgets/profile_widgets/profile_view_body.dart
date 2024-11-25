import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_divider.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_view_list_tile.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/user_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/primary_container.dart';
import 'profile_text_title.dart';
import 'text_profile_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
          ),
          const PrimaryContainer(),
          Positioned(
            left: MediaQuery.sizeOf(context).width * .01,
            top: MediaQuery.sizeOf(context).height * 0.05,
            child: const ProfileViewListTile(),
          ),
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.02,
            top: MediaQuery.sizeOf(context).height * 0.2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    const UserProfileDetails(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ProfileDivider(),
                    const ProfileTextTitle(
                      profileTitle: 'Account Settings',
                    ),
                    const TextProfileButton(
                      buttonText: 'Edit Profile',
                    ),
                    const TextProfileButton(
                      buttonText: 'Change password',
                    ),
                    const TextProfileButton(
                      buttonText: 'Add a payment method',
                    ),
                    const TextProfileButton(
                      buttonText: 'Dark mode',
                    ),
                    const ProfileDivider(),
                    const ProfileTextTitle(
                      profileTitle: 'More',
                    ),
                    const TextProfileButton(
                      buttonText: 'About us',
                    ),
                    const TextProfileButton(
                      buttonText: 'Privacy policy',
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
