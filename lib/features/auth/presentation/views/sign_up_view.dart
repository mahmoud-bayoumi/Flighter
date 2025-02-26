import 'dart:async';
import 'dart:developer';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo_impl.dart';
import 'package:flighter/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flighter/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
    return Scaffold(
      appBar: isConnectedToInternet
          ? AppBar()
          : AppBar(
              automaticallyImplyLeading: false,
            ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt.get<SignUpRepoImpl>()),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
