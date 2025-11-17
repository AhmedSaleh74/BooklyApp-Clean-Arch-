part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  FeaturedBooksSuccess({required this.books});
}

final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String message;

  FeaturedBooksPaginationFailure({required this.message});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;

  FeaturedBooksFailure({required this.message});
}
