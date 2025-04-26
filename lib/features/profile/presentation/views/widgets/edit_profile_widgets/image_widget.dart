import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../constants.dart';
import 'default_profile_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  final File? image;
  final void Function(ImageSource) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final source = await showImageSource(context);
        if (source == null) return;
        onTap(source);
      },
      child: Stack(children: [
        image == null
            ? const DefualtProfileImage()
            : ClipOval(
                child: Image.file(
                  image!,
                  width: 160.w,
                  height: 160.h,
                  fit: BoxFit.cover,
                ),
              ),
        Positioned(
          left: 125.w,
          top: 130.h,
          child: const Icon(
            Icons.add_a_photo,
            color: kPrimaryColor,
          ),
        )
      ]),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
                color: kPrimaryColor,
              ),
              title: const Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: kPrimaryColor,
              ),
              title: const Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        );
      },
    );
  }
}
