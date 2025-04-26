import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/features/profile/data/repos/delete_profile_photo_repo/delete_profile_photo_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_profile_photo_cubit/delete_profile_photo_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/profile_widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            DeleteProfilePhotoCubit(getIt.get<DeleteProfilePhotoRepoImpl>()),
        child: const ProfileViewBody(),
      ),
    );
  }
}
