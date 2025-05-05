import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/custom_text_form_field.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_cubit.dart';
import '../../../../../core/utils/base_cubit/connectivity_cubit/connectivity_state.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/no_internet_connect.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Center(
            child: NoInternetConnectionView(),
          );
        } else {
          var cubitData = context.read<SignUpCubit>();
          return BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                EasyLoading.dismiss();
                AwesomeNotifications()
                    .isNotificationAllowed()
                    .then((isAllowed) {
                  if (!isAllowed) {
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications();
                  }
                });

                GoRouter.of(context).push(AppRouter.kCheckYourEmailView,
                    extra: cubitData.emailController.text);
              } else if (state is SignUpFailure) {
                EasyLoading.dismiss();
                errorDialog(context, state.errMsg);
              } else if (state is SignUpLoading) {
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
                        CustomTextFormField(
                          text: 'Name',
                          hintText: 'ex: jon smith',
                          textEditingController: cubitData.nameController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        CustomTextFormField(
                          text: 'Email',
                          hintText: 'ex:jon_smith@email.com',
                          textEditingController: cubitData.emailController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        PasswordTextFormField(
                          text: 'Password',
                          controller: cubitData.passwordController,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        PasswordTextFormField(
                          controller: cubitData.confirmPasswordController,
                          text: 'Confirm Password',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        state is SignUpLoading
                            ? const CircularProgressIndicator(
                                color: kPrimaryColor,
                              )
                            : CustomButton(
                                text: 'SIGN UP',
                                onPressed: () {
                                  cubitData.validateUser();
                                },
                              ),
                        SizedBox(
                          height: 40.h,
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
            },
          );
        }
      },
    );
  }
}
