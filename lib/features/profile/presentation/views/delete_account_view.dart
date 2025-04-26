import 'package:flighter/core/utils/service_locator.dart';
import 'package:flighter/core/utils/styles.dart';
import 'package:flighter/features/profile/data/repos/delete_account_repo/delete_account_repo_impl.dart';
import 'package:flighter/features/profile/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import 'package:flighter/features/profile/presentation/views/widgets/delete_account_widgets/delete_account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Delete Account ',
          style: Styles.textStyle27,
        ),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            DeleteAccountCubit(getIt.get<DeleteAccountRepoImpl>()),
        child: const DeleteAccountViewBody(),
      )),
    );
  }
}
