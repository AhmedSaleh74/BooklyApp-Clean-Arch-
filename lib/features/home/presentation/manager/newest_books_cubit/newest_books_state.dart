part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksPaginationLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;
  NewestBooksSuccess({required this.books});
}

final class NewestBooksPaginationFailure extends NewestBooksState {
  final String message;

  NewestBooksPaginationFailure({required this.message});
}

final class NewestBooksFailure extends NewestBooksState {
  final String message;

  NewestBooksFailure({required this.message});
}
