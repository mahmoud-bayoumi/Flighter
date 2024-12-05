import 'dart:developer';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_button.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  bool disable = true;
  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<ChangePasswordCubit>();
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordFailure) {
          EasyLoading.dismiss();
          errorDialog(context, state.errMessage);
          log('ChangePassword Failure');
        } else if (state is ChangePasswordLoading) {
          log('ChangePassword Loading');
          EasyLoading.show(status: 'Loading...');
        } else if (state is ChangePasswordSuccess) {
          EasyLoading.dismiss();
          log('ChangePassword Success');
          successDialog(context, false);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: cubitData.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Create a new password. Ensure it differs from previous ones for security',
                    style: Styles.textStyle16
                        .copyWith(color: kGreyColor.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  PasswordTextFormField(
                    controller: cubitData.oldPassword,
                    text: 'Old Password',
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PasswordTextFormField(
                    controller: cubitData.newPassword,
                    text: 'New Password',
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PasswordTextFormField(
                      controller: cubitData.confirmNewPassword,
                      text: 'Confirm New Password'),
                  SizedBox(
                    height: 50.h,
                  ),
                  state is ChangePasswordLoading
                      ? const CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : CustomButton(
                          text: 'Update Password',
                          onPressed: () {
                            cubitData.vaildateUserInput();
                          },
                          height: 73,
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
