import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/check_your_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckYourEmailView extends StatelessWidget {
  const CheckYourEmailView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              VerifyEmailCubit(getIt.get<VerifyEmailRepoImpl>()),
          child: CheckYourEmailBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
