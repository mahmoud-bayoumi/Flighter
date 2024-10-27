import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class SetNewPasswordBody extends StatefulWidget {
  const SetNewPasswordBody({super.key});

  @override
  State<SetNewPasswordBody> createState() => _SetNewPasswordBodyState();
}

class _SetNewPasswordBodyState extends State<SetNewPasswordBody> {
  final key = GlobalKey<FormState>();
  bool disable = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: key,
          child: Column(
            children: [
              Text(
                'Set a new password ',
                style: Styles.textStyle35,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Create a new password. Ensure it differs from previous ones for security',
                style: Styles.textStyle16
                    .copyWith(color: kGreyColor.withOpacity(0.6)),
              ),
              SizedBox(
                height: 40.h,
              ),
              const PasswordTextFormField(
                text: 'Password',
              ),
              SizedBox(
                height: 25.h,
              ),
              const PasswordTextFormField(text: 'Confirm Password'),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                text: 'Update Password',
                onPressed: () {
                  if (key.currentState!.validate()) {
                    setState(() {
                      successDialog(context);
                    });
                  }
                },
                height: 73,
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
