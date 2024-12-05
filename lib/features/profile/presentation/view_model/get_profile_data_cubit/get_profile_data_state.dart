part of 'get_profile_data_cubit.dart';

sealed class GetProfileDataState {}

final class GetProfileDataInitial extends GetProfileDataState {}

final class GetProfileDataLoading extends GetProfileDataState {}

final class GetProfileDataSuccess extends GetProfileDataState {}

final class GetProfileDataFailure extends GetProfileDataState {
  final String errMsg;

  GetProfileDataFailure({required this.errMsg});
}
