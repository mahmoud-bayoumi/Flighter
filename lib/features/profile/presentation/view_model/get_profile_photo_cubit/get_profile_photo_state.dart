part of 'get_profile_photo_cubit.dart';

sealed class GetProfilePhotoState {}

final class GetProfilePhotoInitial extends GetProfilePhotoState {}

final class GetProfilePhotoLoading extends GetProfilePhotoState {}

final class GetProfilePhotoSuccess extends GetProfilePhotoState {}

final class GetProfilePhotoFailure extends GetProfilePhotoState {
  final String errMessage;

  GetProfilePhotoFailure({required this.errMessage}); 
}
