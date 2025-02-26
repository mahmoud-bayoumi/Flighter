import 'dart:developer';
import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/custom_text_form_field.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:flighter/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:flighter/features/auth/presentation/views/widgets/forgot_password_text_button.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/profile/presentation/view_model/get_profile_photo_cubit/get_profile_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets_data.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

bool isConnectedToInternet = true;

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<SignInCubit>();
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          EasyLoading.dismiss();
          log('SignIn Succes');
          var getProfilePhotoCubit = context.read<GetProfilePhotoCubit>();
          getProfilePhotoCubit.getProfilePhoto();

          GoRouter.of(context).pushReplacement(AppRouter.kNavigation);
        } else if (state is SignInFailure) {
          EasyLoading.dismiss();
          errorDialog(context, state.errMessage);
          log('SignIn Failure');
        } else if (state is SignInLoading) {
          EasyLoading.instance
            ..indicatorType = EasyLoadingIndicatorType.fadingCircle
            ..loadingStyle = EasyLoadingStyle.dark
            ..maskType = EasyLoadingMaskType
                .black // Prevents clicks by adding a modal barrier
            ..dismissOnTap =
                false; // Optional: Prevents dismissing the loader on tap
          EasyLoading.show(status: 'loading...');
          log('SignIn Loading');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: cubitData.formKey,
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
                  CustomTextFormField(
                      textEditingController: cubitData.emailController,
                      text: 'Email',
                      hintText: 'ex:jon_smith@gmail.com'),
                  SizedBox(
                    height: 20.h,
                  ),
                  PasswordTextFormField(
                      controller: cubitData.passwordController,
                      text: 'Password'),
                  ForgotPasswordTextButton(
                    onPressed: () => GoRouter.of(context)
                        .push(AppRouter.kForgotPasswordView),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  cubitData.isLoading == false
                      ? CustomButton(
                          text: 'SIGN IN',
                          onPressed: () {
                            cubitData.vaildateUserInput();
                          },
                        )
                      : const CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AuthTextButton(
                    authDesc: 'Dont\' have an account?',
                    authButtonName: 'SIGN UP',
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.kSignUpView),
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
}
