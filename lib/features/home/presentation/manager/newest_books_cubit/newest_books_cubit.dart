import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.getNewestBooksUseCase) : super(NewestBooksInitial());
  final GetNewestBooksUseCase getNewestBooksUseCase;
  Future<void> getNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    final result = await getNewestBooksUseCase.call(pageNumber);
    result.fold(
      (failure) =>
          pageNumber == 0
              ? emit(NewestBooksFailure(message: failure.message))
              : emit(NewestBooksPaginationFailure(message: failure.message)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
