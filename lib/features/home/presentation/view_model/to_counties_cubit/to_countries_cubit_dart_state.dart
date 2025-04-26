part of 'to_countries_cubit_dart_cubit.dart';

sealed class ToCountriesCubitDartState {}

final class ToCountriesInitial extends ToCountriesCubitDartState {}

final class ToCountriestSuccess extends ToCountriesCubitDartState {}

final class ToCountriesLoading extends ToCountriesCubitDartState {}

final class ToCountriesFailure extends ToCountriesCubitDartState {
  final String errorMessage;

  ToCountriesFailure({required this.errorMessage});
}
