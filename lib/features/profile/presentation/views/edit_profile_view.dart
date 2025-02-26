import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../auth/presentation/views/widgets/sign_in_view_body.dart';
import 'widgets/edit_profile_widgets/edit_profile_view_body.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
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
                'Edit Profile',
                style: Styles.textStyle24,
              ),
            ),
            body: SafeArea(
              child: BlocProvider(
                create: (context) =>
                    UpdateProfileCubit(getIt.get<UpdateProfileRepoImpl>()),
                child: const EditProfileViewBody(),
              ),
            ),
          )
        : const Scaffold(
            body: NoInternetConnectionView(),
          );
  }
}
