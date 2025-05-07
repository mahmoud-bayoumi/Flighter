import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/reset_password_repo/reset_password_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/set_new_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt.get<ResetPasswordRepoImpl>()),
          child: SetNewPasswordBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
