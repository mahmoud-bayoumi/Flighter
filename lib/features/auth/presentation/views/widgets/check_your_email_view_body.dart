import 'dart:developer';

import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/verification_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';

class CheckYourEmailBody extends StatefulWidget {
  const CheckYourEmailBody({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<CheckYourEmailBody> createState() => _CheckYourEmailBodyState();
}

class _CheckYourEmailBodyState extends State<CheckYourEmailBody> {
  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<VerifyEmailCubit>();
    cubitData.email = widget.email;
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          EasyLoading.dismiss();
          log('SignIn Succes');
          GoRouter.of(context).pushReplacement(AppRouter.kNavigation);
        } else if (state is VerifyEmailFailure) {
          EasyLoading.dismiss();
          errorDialog(context, state.errMsg);
        } else if (state is VerifyEmailLoading) {
          EasyLoading.show(status: 'loading...');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: cubitData.formKey,
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
                    'We sent a verify code to ${widget.email} enter 4 digit code that mentioned in the email',
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
                  state is VerifyEmailLoading
                      ? const CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : CustomButton(
                          text: 'Verify Code',
                          onPressed: () {
                            cubitData.validateUser();
                          },
                          height: 65,
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AuthTextButton(
                    authDesc: 'Haven’t got the email yet?',
                    authButtonName: 'Resend email',
                    onPressed: () {
                      showSnackBar(
                        context,
                        message:
                            'Check your email. We sent your verification code again!',
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
