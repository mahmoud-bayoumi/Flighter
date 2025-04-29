import 'dart:developer';
import 'package:flighter/features/offers/data/repos/get_offer_repo/get_offer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/offer_ticker_data/offers_model.dart';
import 'get_offer_state.dart';

class GetOfferCubit extends Cubit<GetOfferState> {
  GetOfferCubit(this.getOfferRepo) : super(GetOfferInitial());
  late OfferModel offersModel;
  final GetOfferRepo getOfferRepo;

  Future<void> getOffers() async {
    emit(GetOfferLoading());
    final response = await getOfferRepo.getOffers();
    response.fold(
      (error) {
        log('error in get offers');
        emit(GetOfferFailure(errMessage: error.errMessage));
      },
      (data) {
        offersModel = data;
        log(offersModel.data![0].companyName!);
        log("data offer got successful");
        emit(GetOfferSuccess());
      },
    );
  }

  Future<void> getOffersWithPercentage({int percentage = 10}) async {
    emit(GetOfferLoading());
    final response =
        await getOfferRepo.getOffersWithPrecntage(precentage: percentage);
    response.fold(
      (error) {
        emit(GetOfferFailure(errMessage: error.errMessage));
      },
      (data) {
        offersModel = data;
        emit(GetOfferSuccess());
      },
    );
  }
}
