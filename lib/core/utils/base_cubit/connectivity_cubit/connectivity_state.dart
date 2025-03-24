sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectivityLoading extends ConnectivityState {}

final class ConnectivitySuccess extends ConnectivityState {}

final class ConnectivityFailure extends ConnectivityState {}
