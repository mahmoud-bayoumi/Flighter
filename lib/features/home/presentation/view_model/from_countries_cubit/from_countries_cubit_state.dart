part of 'from_countries_cubit_cubit.dart';

@immutable
sealed class FromCountriesCubitState {}

final class FromCountriesCubitInitial extends FromCountriesCubitState {}

final class FromCountriesCubitLoading extends FromCountriesCubitState {}

final class FromCountriesCubitSuccess extends FromCountriesCubitState {}

final class FromCountriesCubitFailure extends FromCountriesCubitState {}
