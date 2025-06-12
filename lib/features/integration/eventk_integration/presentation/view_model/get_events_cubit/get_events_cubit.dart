
import 'package:flighter/features/integration/eventk_integration/data/models/events_model/events_model.dart';
import 'package:flighter/features/integration/eventk_integration/data/repos/get_events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'get_events_state.dart';


class GetEventsCubit extends Cubit<GetEventsState> {
  late EventsModel eventsModel;
  String toCountry = '';
  final GetEventsRepo eventsRepo;
  GetEventsCubit(this.eventsRepo) : super(GetEventsInitial());
  Future<void> getEvents() async {
    emit(GetEventsLoading());
    final result = await eventsRepo.getEvents();
    result.fold(
      (failure) => emit(GetEventsFailure(failure.errMessage)),
      (events) {
        eventsModel = events;
        emit(GetEventsSuccess());
      },
    );
  }
 
}
