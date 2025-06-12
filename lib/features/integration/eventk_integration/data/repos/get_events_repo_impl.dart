
import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/integration/eventk_integration/data/models/events_model/events_model.dart';
import 'package:flighter/features/integration/eventk_integration/data/repos/get_events_repo.dart';

import '../../../../../core/utils/eventk_api_service.dart';
import '../models/event_model/event_model.dart';

class GetEventsRepoImpl implements GetEventsRepo {
  final String endPointForGetEvents = 'get-events?PageNumber=1&PageSize=100';
  final String endPointForGetEventData = 'get-event/';
  final EventkApiService _eventkApiService;

  GetEventsRepoImpl(this._eventkApiService);

  @override
  Future<Either<Failure, EventsModel>> getEvents() async {
    try {
      var response =
          await _eventkApiService.get(endPoint: endPointForGetEvents);
      return right(EventsModel.fromJson(response));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventModel>> getEventData(
      {required int eventId}) async {
    try {
      var response = await _eventkApiService.get(
          endPoint: endPointForGetEventData + eventId.toString());
       return right(EventModel.fromJson(response));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
