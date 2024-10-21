
import 'package:flighter/features/auth/presentation/views/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets_data.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SocialButton(imagePath: AssetsData.kGoogleLogo),
        SizedBox(
          width: 30.w,
        ),
        const SocialButton(imagePath: AssetsData.kFaceLogo),
      ],
    );
  }
}
