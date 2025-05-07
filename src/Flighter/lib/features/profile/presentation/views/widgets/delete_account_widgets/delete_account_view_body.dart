import 'package:flighter/constants.dart';
import 'package:flighter/core/utils/functions/dialogs_type.dart';
import 'package:flighter/core/widgets/custom_button.dart';
import 'package:flighter/core/widgets/password_text_form_field.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeleteAccountViewBody extends StatelessWidget {
  const DeleteAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    var dataCubit = context.read<DeleteAccountCubit>();
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          EasyLoading.dismiss();
          storage.delete(key: tokenKey);
          deleteDoneDialog(context);
        } else if (state is DeleteAccountLoading) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is DeleteAccountFailure) {
          EasyLoading.dismiss();
          errorDialog(context, state.errMsg);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: dataCubit.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  PasswordTextFormField(
                    controller: dataCubit.password,
                    text: 'Your Password',
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  state is DeleteAccountLoading
                      ? const CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : CustomButton(
                          text: 'Delete Account',
                          onPressed: () {
                            dataCubit.vaildateUserInput();
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
      },
    );
  }
}
