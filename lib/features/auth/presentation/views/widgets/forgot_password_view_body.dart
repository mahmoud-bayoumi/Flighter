import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/email_card_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Forgot Password',
              style: Styles.textStyle35,
            ),
            SizedBox(
              height: 80.h,
            ),
            const EmailCardFormField(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '* We will send you a message to set or reset your new password',
              style: Styles.textStyle17.copyWith(color: Colors.red),
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomButton(
              height: 65,
              text: 'Send',
              onPressed: () =>
                  GoRouter.of(context).push(AppRouter.kCheckYourEmailView),
            ),
          ],
        ),
      ),
    );
  }
}
