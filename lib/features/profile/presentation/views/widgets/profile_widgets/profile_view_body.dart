import 'package:flighter/constants.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_divider.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_view_list_tile.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/user_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/functions/capitalize_word.dart';
import '../../../../../../core/utils/secure_storage.dart';
import '../../../../../../core/widgets/primary_container.dart';
import '../../../view_model/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'logout_button.dart';
import 'profile_text_title.dart';
import 'text_profile_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  final SecureStorageService _secureStorageService =
      const SecureStorageService();
  @override
  Widget build(BuildContext context) {
    var getData = context.read<GetProfileDataCubit>();
    getData.getProfile();
    String userName = getData.profileData!.name!;
    userName = capitalizeEachWord(userName);

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
            left: MediaQuery.sizeOf(context).width * .85,
            top: MediaQuery.sizeOf(context).height * 0.05,
            child: LogoutButton(
              onPressed: () async {
                await _secureStorageService.deleteToken(tokenKey);
                var cubitData = context.read<GetProfilePhotoCubit>();
                cubitData.clearProfilePhoto();
                GoRouter.of(context).pushReplacement('/');
              },
            ),
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
                    UserProfileDetails(
                      userName: userName,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ProfileDivider(),
                    const ProfileTextTitle(
                      profileTitle: 'Account Settings',
                    ),
                    TextProfileButton(
                      buttonText: 'Edit Profile',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kEditProfileView);
                      },
                    ),
                    TextProfileButton(
                      buttonText: 'Change password',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kChangePassword);
                      },
                    ),
                    TextProfileButton(
                      buttonText: 'Add a payment method',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kAddPayment);
                      },
                    ),
                    TextProfileButton(
                      buttonText: 'Delete Account',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDeleteAccount);
                      },
                    ),
                    const ProfileDivider(),
                    const ProfileTextTitle(
                      profileTitle: 'More',
                    ),
                    TextProfileButton(
                      buttonText: 'About us',
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kAboutUs),
                    ),
                    TextProfileButton(
                      buttonText: 'Privacy policy',
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kPrivacyAndPolicy),
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
