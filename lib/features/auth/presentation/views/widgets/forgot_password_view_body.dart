import 'dart:developer';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/email_card_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../../core/utils/functions/dialogs_type.dart';
import '../../../../../core/widgets/no_internet_connect.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        } else if (state is ConnectivityLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var cubitData = context.read<SendResetPasswordCodeCubit>();
          return BlocConsumer<SendResetPasswordCodeCubit,
              SendResetPasswordCodeCubitState>(
            listener: (context, state) {
              if (state is SendResetPasswordCodeCubitLoading) {
                EasyLoading.show(status: 'loading...');
                log('sendReset lodaing');
              } else if (state is SendResetPasswordCodeCubitFailure) {
                EasyLoading.dismiss();
                errorDialog(context, state.errMessage);
                log('SendReset Failure');
              } else if (state is SendResetPasswordCodeCubitSent) {
                EasyLoading.dismiss();
                log('SendReset Success');
                GoRouter.of(context).push(
                    AppRouter.kCheckYourEmailViewForForgetPass,
                    extra: cubitData.emailController.text);
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
                        EmailCardFormField(
                          controller: cubitData.emailController,
                        ),
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
                          onPressed: () {
                            cubitData.vaildateUserInput();
                          },
                        ),
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
