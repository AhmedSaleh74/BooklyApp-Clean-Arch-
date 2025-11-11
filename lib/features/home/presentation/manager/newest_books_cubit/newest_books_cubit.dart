import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/get_featured_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.getFeaturedBooksUseCase) : super(NewestBooksInitial());

  final GetFeaturedBooksUseCase getFeaturedBooksUseCase;
  Future<void> getFeaturedBooks() async {
    emit(NewestBooksLoading());
    final result = await getFeaturedBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksFailure(message: failure.message)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
