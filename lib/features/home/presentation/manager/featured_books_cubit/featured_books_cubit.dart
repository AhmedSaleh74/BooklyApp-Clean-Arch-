import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/get_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.getFeaturedBooksUseCase)
    : super(FeaturedBooksInitial());
  final GetFeaturedBooksUseCase getFeaturedBooksUseCase;
  Future<void> getFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    final result = await getFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(FeaturedBooksFailure(message: failure.message)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
