import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/verification_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CheckYourEmailBody extends StatefulWidget {
  const CheckYourEmailBody({
    super.key,
  });

  @override
  State<CheckYourEmailBody> createState() => _CheckYourEmailBodyState();
}

class _CheckYourEmailBodyState extends State<CheckYourEmailBody> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _key,
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
                'We sent a reset link to contact@dscode.com enter 4 digit code that mentioned in the email',
                style: Styles.textStyle16
                    .copyWith(color: kGreyColor.withOpacity(0.6)),
              ),
              SizedBox(
                height: 50.h,
              ),
              const VerificationCodeRow(),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                text: 'Verify Code',
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kSetNewPasswordView);
                  }
                },
                height: 65,
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
      ),
    );
  }
}
