sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucess extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure({required this.errMessage});
}
