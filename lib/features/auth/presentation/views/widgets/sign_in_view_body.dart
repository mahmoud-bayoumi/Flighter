import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/custom_text_form_field.dart';
import 'package:flighter/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_data.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.kLogo,
            width: 150.w,
            height: 150.h,
          ),
          Text(
            'Sign in your account',
            style: Styles.textStyle27,
          ),
          const CustomTextFormField(
              text: 'Email', hintText: 'ex:jon.smith@gmail.com'),
          SizedBox(
            height: 20.h,
          ),
          const PasswordTextFormField(text: 'Password', hintText: '••••••••'),
          const ForgotPassword(),
          const CustomButton(),
        ],
      ),
    );
  }
}
