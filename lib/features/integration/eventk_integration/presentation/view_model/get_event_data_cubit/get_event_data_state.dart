
sealed class GetEventDataState {}

final class GetEventDataInitial extends GetEventDataState {}

final class GetEventDataLoading extends GetEventDataState {}

final class GetEventDataSuccess extends GetEventDataState {}

final class GetEventDataFailure extends GetEventDataState {
  final String errMsg ; 
  GetEventDataFailure(this.errMsg);
}
