import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/profile/data/repos/delete_account_repo/delete_account_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/delete_account_widgets/delete_account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../auth/presentation/views/widgets/sign_in_view_body.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
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
                'Delete Account ',
                style: Styles.textStyle27,
              ),
            ),
            body: SafeArea(
                child: BlocProvider(
              create: (context) =>
                  DeleteAccountCubit(getIt.get<DeleteAccountRepoImpl>()),
              child: const DeleteAccountViewBody(),
            )),
          )
        : const NoInternetConnectionView();
  }
}
