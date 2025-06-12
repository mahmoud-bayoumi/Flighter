import 'package:flighter/features/home/data/models/to_model.dart';
import 'package:flighter/features/home/data/repos/to_countries_repo/to_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'to_countries_cubit_dart_state.dart';

class ToCountriesCubit extends Cubit<ToCountriesCubitDartState> {
  ToCountriesCubit(this._toRepoImpl) : super(ToCountriesInitial());

  ToModel? toModel;
  final ToRepoImpl _toRepoImpl;

  Future<void> getToCountries() async {
    emit(ToCountriesLoading());

    var data = await _toRepoImpl.getToCountries();

    data.fold(
      (error) {
        emit(ToCountriesFailure(errorMessage: error.errMessage));
      },
      (response) {
        toModel = response;
        emit(ToCountriestSuccess());
      },
    );
  }
}
