import 'package:flighter/core/utils/styles.dart';
import 'package:flutter/material.dart';

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
        body: const SafeArea(child: EditProfileViewBody()));
  }
}
