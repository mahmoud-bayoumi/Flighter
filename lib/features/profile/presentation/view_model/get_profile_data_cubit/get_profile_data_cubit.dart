import 'package:flighter/features/profile/data/repos/get_profile_data/get_profile_data_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit(this._getProfileDataRepoImpl)
      : super(GetProfileDataInitial());
  final GetProfileDataRepoImpl _getProfileDataRepoImpl;

  Future<void> getProfile() async {
    emit(GetProfileDataLoading());
    var data = await _getProfileDataRepoImpl.getProfileData();

    data.fold(
      (error) {
        emit(GetProfileDataFailure(errMsg: error.errMessage));
      },
      (response) {
        emit(GetProfileDataSuccess());
      },
    );
  }
}
