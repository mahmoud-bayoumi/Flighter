import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/send_reset_pass_code_repo/send_reset_pass_code_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/verify_reset_pass_code_repo/verify_reset_pass_code_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/verify_reset_pass_code_cubit/verify_reset_pass_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/check_your_email_view_body_for_forget_password.dart';

class CheckYourEmailForForgetPassView extends StatelessWidget {
  const CheckYourEmailForForgetPassView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => VerifyResetPassCodeCubit(
                  getIt.get<VerifyResetPassCodeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => SendResetPasswordCodeCubit(
                  getIt.get<SendResetPassCodeRepoImpl>()),
            ),
          ],
          child: CheckYourEmailViewBodyForForgetPassword(
            email: email,
          ),
        ),
      ),
    );
  }
}
