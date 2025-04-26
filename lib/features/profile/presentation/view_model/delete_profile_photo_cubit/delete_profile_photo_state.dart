part of 'delete_profile_photo_cubit.dart';

sealed class DeleteProfilePhotoState {}

final class DeleteProfilePhotoInitial extends DeleteProfilePhotoState {}

final class DeleteProfilePhotoLoading extends DeleteProfilePhotoState {}

final class DeleteProfilePhotoSuccess extends DeleteProfilePhotoState {}

final class DeleteProfilePhotoFailure extends DeleteProfilePhotoState {
  final String errMessage;

  DeleteProfilePhotoFailure({required this.errMessage});
}
