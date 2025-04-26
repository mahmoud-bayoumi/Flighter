import 'dart:developer';

import 'package:flighter/features/home/data/repos/from_countries_repo/from_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'from_countries_cubit_state.dart';

class FromCountriesCubit extends Cubit<FromCountriesCubitState> {
  final FromRepo fromRepo;
  late List<dynamic> fromCountries;
  FromCountriesCubit(this.fromRepo) : super(FromCountriesCubitInitial());
  Future<void> getFromCountries() async {
    emit(FromCountriesCubitLoading());
    var response = await fromRepo.getFromCountries();
    response.fold(
      (l) {
        log(l.errMessage);
        emit(FromCountriesCubitFailure(errMessage: l.errMessage));
      },
      (r) {
        fromCountries = r.data;
        emit(FromCountriesCubitSuccess());
      },
    );
  }
}
