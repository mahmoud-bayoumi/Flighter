import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/profile/data/repos/change_password_repo/change_password_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../core/utils/styles.dart';
import '../../../auth/presentation/views/widgets/sign_in_view_body.dart';
import 'widgets/change_password_widgets/change_password_body.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
            )))
        : const NoInternetConnectionView();
  }
}
