import 'package:flighter/features/auth/presentation/views/widgets/code_form_field.dart';
import 'package:flutter/material.dart';

class VerificationCodeRow extends StatelessWidget {
  const VerificationCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CodeFormField(),
        CodeFormField(),
        CodeFormField(),
        CodeFormField(),
      ],
    );
  }
}
