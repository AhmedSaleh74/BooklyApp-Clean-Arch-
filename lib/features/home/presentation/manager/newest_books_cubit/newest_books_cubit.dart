import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.getNewestBooksUseCase) : super(NewestBooksInitial());

  final GetNewestBooksUseCase getNewestBooksUseCase;
  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await getNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksFailure(message: failure.message)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
