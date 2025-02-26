import 'dart:async';
import 'dart:developer';

import 'package:flighter/core/utils/app_router.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/email_card_form_field.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../../../core/utils/functions/dialogs_type.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
   StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
        log(event.toString());
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isConnectedToInternet = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isConnectedToInternet = false;
            });

            break;
          default:
            setState(() {
              isConnectedToInternet = false;
            });
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<SendResetPasswordCodeCubit>();
    return isConnectedToInternet ?  BlocConsumer<SendResetPasswordCodeCubit,
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
          GoRouter.of(context).push(AppRouter.kCheckYourEmailViewForForgetPass,
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
    ) : NoInternetConnectionView();
  }
}
