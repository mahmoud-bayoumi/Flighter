import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure.dart';
import '../models/event_model/event_model.dart';
import '../models/events_model/events_model.dart';

abstract class GetEventsRepo {
  Future<Either<Failure, EventsModel>> getEvents();

  Future<Either<Failure, EventModel>> getEventData({required int eventId});
}
