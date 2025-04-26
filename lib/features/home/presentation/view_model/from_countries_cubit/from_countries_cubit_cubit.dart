import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'from_countries_cubit_state.dart';

class FromCountriesCubitCubit extends Cubit<FromCountriesCubitState> {
  FromCountriesCubitCubit() : super(FromCountriesCubitInitial());
}
