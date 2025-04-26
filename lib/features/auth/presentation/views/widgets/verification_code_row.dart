import 'package:flighter/features/auth/presentation/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flighter/features/auth/presentation/views/widgets/code_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeRow extends StatelessWidget {
  const VerificationCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitData = context.read<VerifyEmailCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CodeFormField(
          controller: cubitData.code1,
        ),
        CodeFormField(
          controller: cubitData.code2,
        ),
        CodeFormField(
          controller: cubitData.code3,
        ),
        CodeFormField(
          controller: cubitData.code4,
        ),
      ],
    );
  }
}
