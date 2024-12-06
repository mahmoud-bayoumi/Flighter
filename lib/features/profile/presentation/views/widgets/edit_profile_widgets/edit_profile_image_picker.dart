// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../view_model/update_profile_cubit/update_profile_cubit.dart';
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
  void initState() {
    super.initState();
    _loadSavedImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      image: image,
      onTap: (source) => pickImage(context, source),
    );
  }

  Future pickImage(BuildContext context, ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      //  final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(
          image.path); // this one it will be send to the backend endpoint
      context.read<UpdateProfileCubit>().imageFile = imagePermanent;
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      log('Failed to pick iamge : $e');
    }
  }

  Future<void> _loadSavedImagePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/name'; // The image file path
    final file = File(path);

    // Check if the file exists, and if it does, load it into the state
    if (await file.exists()) {
      setState(() {
        image = file; // Load the saved image
      });
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }
}
