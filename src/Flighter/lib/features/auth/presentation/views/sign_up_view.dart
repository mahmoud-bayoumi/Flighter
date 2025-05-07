import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt.get<SignUpRepoImpl>()),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
