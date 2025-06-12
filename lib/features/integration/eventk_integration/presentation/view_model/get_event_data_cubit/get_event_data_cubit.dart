import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/event_model/event_model.dart';
import '../../../data/repos/get_events_repo.dart';
import 'get_event_data_state.dart';

class GetEventDataCubit extends Cubit<GetEventDataState> {
  late int eventId;
  late  EventModel eventModel;
  final GetEventsRepo eventsRepo;

  GetEventDataCubit(this.eventsRepo) : super(GetEventDataInitial());
  Future<void> getEventsData() async {
    emit(GetEventDataLoading());
    final result = await eventsRepo.getEventData(eventId: eventId);
    result.fold(
      (failure) => emit(GetEventDataFailure(failure.errMessage)),
      (event) {
        eventModel = event;
        emit(GetEventDataSuccess());
      },
    );
  }
}
