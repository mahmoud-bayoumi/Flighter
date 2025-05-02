import 'package:flighter/features/profile/data/repos/delete_account_repo/delete_account_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._deleteAccountRepoImpl)
      : super(DeleteAccountInitial());
  final DeleteAccountRepoImpl _deleteAccountRepoImpl;
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var data = await _deleteAccountRepoImpl.deleteAccount(
        password: password.text.trim());

    data.fold(
      (error) {
        emit(DeleteAccountFailure(errMsg: error.errMessage));
      },
      (success) {
        emit(DeleteAccountSuccess());
      },
    );
  }

  void vaildateUserInput() {
    if (formKey.currentState!.validate()) {
      deleteAccount();
    }
  }
}
