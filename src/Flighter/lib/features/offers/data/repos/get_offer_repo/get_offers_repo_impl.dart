import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/core/utils/offers_api_service.dart';
import 'package:flighter/features/offers/data/models/offer_ticker_data/offers_model.dart';
import 'package:flighter/features/offers/data/repos/get_offer_repo/get_offer_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../constants.dart';

class GetOffersRepoImpl implements GetOfferRepo {
  final OffersApiService _offerApiService;
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();
  String endPoint = 'available-offers';

  GetOffersRepoImpl({required OffersApiService offerApiService})
      : _offerApiService = offerApiService;

  @override
  Future<Either<Failure, OfferModel>> getOffers() async {
    final token = await _flutterSecureStorage.read(key: tokenKey);
    try {
      var response =
          await _offerApiService.get(endPoint: endPoint, token: token!);
      if (response['success']) {
        return right(OfferModel.fromJson(response));
      } else {
        return left(Failure(response['message']));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //http://hmy.runasp.net/api/Offer/offers/5
  //offers/5
  @override
  Future<Either<Failure, OfferModel>> getOffersWithPrecntage(
      {int precentage = 10}) async {
    String query = 'offers/$precentage';

    final token = await _flutterSecureStorage.read(key: tokenKey);
    try {
      var response = await _offerApiService.get(endPoint: query, token: token!);
      if (response['success']) {
        return right(OfferModel.fromJson(response));
      } else {
        log(response.toString());
        if (response["message"] ==
            "No available tickets found with $precentage% offer.") {
          log('X');
          return right(OfferModel.fromJson(response));
        }
        return left(Failure(response['message']));
      }
    } on DioException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
