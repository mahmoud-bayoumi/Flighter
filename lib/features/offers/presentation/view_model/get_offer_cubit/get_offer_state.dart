sealed class GetOfferState {}

class GetOfferInitial extends GetOfferState {
  final String? forceId;
  GetOfferInitial({this.forceId});
}


final class GetOfferSuccess extends GetOfferState {}

final class GetOfferLoading extends GetOfferState {}

final class GetOfferFailure extends GetOfferState {
  final String errMessage;

  GetOfferFailure({required this.errMessage});
}
