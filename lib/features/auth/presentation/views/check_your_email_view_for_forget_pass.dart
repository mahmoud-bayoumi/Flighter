import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/send_reset_pass_code_repo/send_reset_pass_code_repo_impl.dart';
import 'package:flighter/features/auth/data/repos/reset_password_repos/verify_reset_pass_code_repo/verify_reset_pass_code_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/send_reset_pass_code_cubit/send_reset_password_code_cubit_cubit.dart';
import 'package:flighter/features/auth/presentation/view_model/reset_pass_code_cubits/verify_reset_pass_code_cubit/verify_reset_pass_code_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../core/widgets/no_internet_connection_view.dart';
import 'widgets/check_your_email_view_body_for_forget_password.dart';

class CheckYourEmailForForgetPassView extends StatefulWidget {
  const CheckYourEmailForForgetPassView({super.key, required this.email});
  final String email;

  @override
  State<CheckYourEmailForForgetPassView> createState() =>
      _CheckYourEmailForForgetPassViewState();
}

class _CheckYourEmailForForgetPassViewState
    extends State<CheckYourEmailForForgetPassView> {
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
                  email: widget.email,
                ),
              ),
            ),
          )
        : const NoInternetConnectionView();
  }
}
