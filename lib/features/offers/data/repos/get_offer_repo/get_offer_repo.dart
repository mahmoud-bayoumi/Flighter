import 'package:dartz/dartz.dart';
import 'package:flighter/features/offers/data/models/offer_ticker_data/offers_model.dart';

import '../../../../../core/utils/failure.dart';

abstract class GetOfferRepo {
  Future<Either<Failure, OfferModel>> getOffers();

  Future<Either<Failure, OfferModel>> getOffersWithPrecntage(
      {int precentage = 10});
}
