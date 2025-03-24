import 'dart:async';

import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/widgets/no_internet_connection_view.dart';
import 'package:flighter/features/profile/data/repos/delete_profile_photo_repo/delete_profile_photo_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_profile_photo_cubit/delete_profile_photo_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../auth/presentation/views/widgets/sign_in_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
            body: BlocProvider(
              create: (context) => DeleteProfilePhotoCubit(
                  getIt.get<DeleteProfilePhotoRepoImpl>()),
              child: const ProfileViewBody(),
            ),
          )
        : const Scaffold(
            body: NoInternetConnectionView(),
          );
  }
}
