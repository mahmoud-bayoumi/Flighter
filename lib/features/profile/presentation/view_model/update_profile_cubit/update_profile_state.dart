part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileFailure extends UpdateProfileState {
  final String errMsh;

  UpdateProfileFailure({required this.errMsh});
}

final class UpdateProfileSuccess extends UpdateProfileState {}
