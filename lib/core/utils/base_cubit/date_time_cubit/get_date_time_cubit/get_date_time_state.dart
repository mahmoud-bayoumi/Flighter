abstract class GetTimeState {}

class GetTimeInitial extends GetTimeState {}

class GetTimeLoading extends GetTimeState {}

class GetTimeSuccess extends GetTimeState {

}

class GetTimeFailure extends GetTimeState {
  final String error;

  GetTimeFailure(this.error);
}
