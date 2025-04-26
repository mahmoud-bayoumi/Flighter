import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/reset_password_repos/send_reset_pass_code_repo/send_reset_pass_code_repo_impl.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            SendResetPasswordCodeCubit(getIt.get<SendResetPassCodeRepoImpl>()),
        child: const ForgotPasswordViewBody(),
      )),
    );
  }
}
