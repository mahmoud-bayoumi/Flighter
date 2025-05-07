sealed class GetOfferState {}

final class GetOfferInitial extends GetOfferState {}

final class GetOfferSuccess extends GetOfferState {}

final class GetOfferLoading extends GetOfferState {}

final class GetOfferFailure extends GetOfferState {
  final String errMessage;

  GetOfferFailure({required this.errMessage});
}
