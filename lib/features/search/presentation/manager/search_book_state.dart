part of 'search_book_cubit.dart';

@immutable
sealed class SearchBookState {
  final String query;
  const SearchBookState({required this.query});
}

final class SearchBookInitial extends SearchBookState {
  const SearchBookInitial() : super(query: '');
}

final class SearchBookLoading extends SearchBookState {
  const SearchBookLoading({required super.query});
}

final class SearchBookPaginationLoading extends SearchBookState {
  const SearchBookPaginationLoading({required super.query});
}

final class SearchBookFailure extends SearchBookState {
  final String message;
  const SearchBookFailure({required this.message, required super.query});
}

final class SearchBookPaginationFailure extends SearchBookState {
  final String message;
  const SearchBookPaginationFailure({
    required this.message,
    required super.query,
  });
}

final class SearchBookSuccess extends SearchBookState {
  final List<SearchBookEntity> books;
  final bool isPagination;
  const SearchBookSuccess({
    required this.books,
    required this.isPagination,
    required super.query,
  });
}
