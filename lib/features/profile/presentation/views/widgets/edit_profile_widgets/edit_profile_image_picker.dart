import 'dart:io';
import 'package:flighter/features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_widget.dart';

class EditProfileImagePicker extends StatefulWidget {
  const EditProfileImagePicker({super.key});

  @override
  State<EditProfileImagePicker> createState() => _EditProfileImagePickerState();
}

class _EditProfileImagePickerState extends State<EditProfileImagePicker> {
  File? image;
  String? savedImagePath;
  @override
  @override
  Widget build(BuildContext context) {
    var updateCubit = context.read<UpdateProfileCubit>();
    return ImageWidget(
      image: image,
      onTap: (source) => updateCubit.pickImage(source),
    );
  }
}
