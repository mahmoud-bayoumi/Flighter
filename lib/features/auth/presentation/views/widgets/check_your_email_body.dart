
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/code_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckYourEmailBody extends StatelessWidget {
  const CheckYourEmailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check your email',
              style: Styles.textStyle35,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'We sent a reset link to contact@dscode.com enter 5 digit code that mentioned in the email',
              style: Styles.textStyle16
                  .copyWith(color: kGreyColor.withOpacity(0.6)),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CodeFormField(),
                SizedBox(
                  width: 20.w,
                ),
                const CodeFormField(),
                SizedBox(
                  width: 20.w,
                ),
                const CodeFormField(),
                SizedBox(
                  width: 20.w,
                ),
                const CodeFormField(),
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomButton(
              text: 'Verify Code',
              onPressed: () {},
              height: 73,
            ),
            SizedBox(
              height: 30.h,
            ),
            const AuthTextButton(
                authDesc: 'Haven’t got the email yet?',
                authButtonName: 'Resend email')
          ],
        ),
      ),
    );
  }
}
