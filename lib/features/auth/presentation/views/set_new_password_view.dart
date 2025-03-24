import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/reset_password_repo/reset_password_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/set_new_password_view_body.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class SetNewPasswordView extends StatefulWidget {
  const SetNewPasswordView({super.key, required this.email});
  final String email;

  @override
  State<SetNewPasswordView> createState() => _SetNewPasswordViewState();
}

class _SetNewPasswordViewState extends State<SetNewPasswordView> {
  StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
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
    return isConnectedToInternet
        ? Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: BlocProvider(
                create: (context) =>
                    ResetPasswordCubit(getIt.get<ResetPasswordRepoImpl>()),
                child: SetNewPasswordBody(
                  email: widget.email,
                ),
              ),
            ),
          )
        : const NoInternetConnectionView();
  }
}
