import 'package:flighter/constants.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/custom_text_form_field.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/social_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Create your account',
                style: Styles.textStyle35,
              ),
              SizedBox(
                height: 25.h,
              ),
              const CustomTextFormField(
                  text: 'Name', hintText: 'ex: jon smith'),
              SizedBox(
                height: 14.h,
              ),
              const CustomTextFormField(
                  text: 'Email', hintText: 'ex: jon.smith@email.com'),
              SizedBox(
                height: 14.h,
              ),
              const PasswordTextFormField(
                text: 'Password',
              ),
              SizedBox(
                height: 14.h,
              ),
              const PasswordTextFormField(
                text: 'Confirm Password',
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                text: 'SIGN UP',
                onPressed: () {
                  if (key.currentState!.validate()) {}

                  GoRouter.of(context).push(AppRouter.kCheckYourEmailView);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'or sign up with',
                style: Styles.textStyle16.copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              const SocialAuthButtons(),
              SizedBox(
                height: 15.h,
              ),
              AuthTextButton(
                authDesc: 'Have an account?',
                authButtonName: 'SIGN IN',
                onPressed: () => GoRouter.of(context).pop(),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
