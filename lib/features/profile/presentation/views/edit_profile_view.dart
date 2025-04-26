import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_profile_widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
