import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/custom_text_form_field.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/auth/presentation/views/widgets/social_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets_data.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Image.asset(
              AssetsData.kLogo,
              width: 160.w,
              height: 160.h,
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Sign in your account',
              style: Styles.textStyle35,
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomTextFormField(
                text: 'Email', hintText: 'ex:jon.smith@gmail.com'),
            SizedBox(
              height: 20.h,
            ),
            const PasswordTextFormField(text: 'Password', hintText: '••••••••'),
            ForgotPassword(
              onPressed: () =>
                  GoRouter.of(context).push(AppRouter.kForgotPasswordView),
            ),
            SizedBox(
              height: 12.h,
            ),
            const CustomButton(
              text: 'SIGN IN',
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'or sign in with',
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
              authDesc: 'Dont\' have an account?',
              authButtonName: 'SIGN UP',
              onPressed: () => GoRouter.of(context).push(AppRouter.kSignUpView),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
