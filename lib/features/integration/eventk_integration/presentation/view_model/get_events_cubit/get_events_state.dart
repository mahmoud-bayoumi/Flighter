
sealed class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsLoading extends GetEventsState {}

final class GetEventsSuccess extends GetEventsState {}

final class GetEventsFailure extends GetEventsState {
  final String errMsg;  
  GetEventsFailure(this.errMsg);
}
