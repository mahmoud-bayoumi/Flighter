import 'dart:developer';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/verification_code_row_for_forget_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/no_internet_connect.dart';
import '../../view_model/reset_pass_code_cubits/verify_reset_pass_code_cubit/verify_reset_pass_code_cubit.dart';

class CheckYourEmailViewBodyForForgetPassword extends StatefulWidget {
  const CheckYourEmailViewBodyForForgetPassword({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<CheckYourEmailViewBodyForForgetPassword> createState() =>
      _CheckYourEmailBodyForForgetPassState();
}

class _CheckYourEmailBodyForForgetPassState
    extends State<CheckYourEmailViewBodyForForgetPassword> {
  @override
  void initState() {
    super.initState();
    // Initialize the email only once when the widget is first created
    var cubitData = context.read<VerifyResetPassCodeCubit>();
    cubitData.email = widget.email; // Make sure email is set properly here
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        }  else {
          var cubitData = context.read<VerifyResetPassCodeCubit>();
          return BlocConsumer<VerifyResetPassCodeCubit,
              VerifyResetPassCodeState>(
            listener: (context, state) {
              if (state is VerifyResetPassCodeSuccess) {
                EasyLoading.dismiss();
                log('Verify Success');
                GoRouter.of(context)
                    .push(AppRouter.kSetNewPasswordView, extra: widget.email);
              } else if (state is VerifyResetPassCodeFailure) {
                log('Verify Failure');
                EasyLoading.dismiss();
                errorDialog(context, state.errMessage);
              } else if (state is VerifyResetPassCodeLoading) {
                log('Verify Loading');
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
                        const VerificationCodeRowForForgetPass(),
                        SizedBox(
                          height: 60.h,
                        ),
                        state is VerifyResetPassCodeLoading
                            ? const CircularProgressIndicator(
                                color: kPrimaryColor,
                              )
                            : CustomButton(
                                text: 'Verify Code',
                                onPressed: () {
                                  cubitData.vaildateUserInput();
                                },
                                height: 65,
                              ),
                        SizedBox(
                          height: 30.h,
                        ),
                        AuthTextButton(
                          authDesc: 'Haven’t got the reset code yet?',
                          authButtonName: 'Resend code',
                          onPressed: () {
                            var sendResetCubitData =
                                context.read<SendResetPasswordCodeCubit>();
                            sendResetCubitData.emailController.text =
                                cubitData.email;
                            sendResetCubitData.sendPasswordCode();
                            showSnackBar(
                              context,
                              message:
                                  'Check your email. We sent your reset code again!',
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
      },
    );
  }
}
