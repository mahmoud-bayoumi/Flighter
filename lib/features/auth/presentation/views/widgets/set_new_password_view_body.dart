import 'dart:developer';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class SetNewPasswordBody extends StatefulWidget {
  const SetNewPasswordBody({super.key, required this.email});
  final String email;
  @override
  State<SetNewPasswordBody> createState() => _SetNewPasswordBodyState();
}

class _SetNewPasswordBodyState extends State<SetNewPasswordBody> {
  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<ResetPasswordCubit>();
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordLoading) {
          EasyLoading.show(status: 'loading...');
          log('sendReset lodaing');
        } else if (state is ResetPasswordFailure) {
          EasyLoading.dismiss();
          errorDialog(context, state.errMessage);
          log('SendReset Failure');
        } else if (state is ResetPasswordSuccess) {
          EasyLoading.dismiss();
          log('SendReset Success');
          successDialog(context, true);
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
                  Text(
                    'Set a new password ',
                    style: Styles.textStyle35,
                  ),
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
                    controller: cubitData.newPasswordController,
                    text: 'Password',
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PasswordTextFormField(
                      controller: cubitData.confirmNewPasswordController,
                      text: 'Confirm Password'),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomButton(
                    text: 'Update Password',
                    onPressed: () {
                      cubitData.emailController.text = widget.email;
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
