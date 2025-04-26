import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/profile/data/repos/change_password_repo/change_password_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/change_password_widgets/change_password_body.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Set a new password ',
            style: Styles.textStyle27,
          ),
        ),
        body: SafeArea(
            child: BlocProvider(
          create: (context) =>
              ChangePasswordCubit(getIt.get<ChangePasswordRepoImpl>()),
          child: const ChangePasswordBody(),
        )));
  }
}
