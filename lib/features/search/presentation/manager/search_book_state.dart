part of 'search_book_cubit.dart';

@immutable
sealed class SearchBookState {}

final class SearchBookInitial extends SearchBookState {}

final class SearchBookLoading extends SearchBookState {}

final class SearchBookPaginationLoading extends SearchBookState {}

final class SearchBookFailure extends SearchBookState {
  final String message;
  SearchBookFailure({required this.message});
}

final class SearchBookPaginationFailure extends SearchBookState {
  final String message;

  SearchBookPaginationFailure({required this.message});
}

final class SearchBookSuccess extends SearchBookState {
  final List<SearchBookEntity> books;

  SearchBookSuccess({required this.books});
}
