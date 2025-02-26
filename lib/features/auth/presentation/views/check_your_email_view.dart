import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/auth/data/repos/verify_email_repo/verify_email_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/check_your_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'widgets/sign_in_view_body.dart';

class CheckYourEmailView extends StatefulWidget {
  const CheckYourEmailView({super.key, required this.email});
  final String email;

  @override
  State<CheckYourEmailView> createState() => _CheckYourEmailViewState();
}

class _CheckYourEmailViewState extends State<CheckYourEmailView> {
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
                    VerifyEmailCubit(getIt.get<VerifyEmailRepoImpl>()),
                child: CheckYourEmailBody(
                  email: widget.email,
                ),
              ),
            ),
          )
        : const NoInternetConnectionView();
  }
}
