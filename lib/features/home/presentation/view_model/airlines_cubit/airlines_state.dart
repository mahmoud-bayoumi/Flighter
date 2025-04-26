

sealed class AirlinesState {}

final class AirlinesInitial extends AirlinesState {}

final class AirlinesLoading extends AirlinesState {}

final class AirlinesFailure extends AirlinesState {
  final String errMessage;

  AirlinesFailure({required this.errMessage});
}

final class AirlinesSuccess extends AirlinesState {}
