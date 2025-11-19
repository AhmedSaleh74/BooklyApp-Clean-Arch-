import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/domain/entities/search_book_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/use_cases/search_case_params.dart';
import '../../domain/use_cases/search_books_use_case.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBooksUseCase) : super(SearchBookInitial());
  final SearchBooksUseCase searchBooksUseCase;
  Future<void> searchBooks({required String query, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchBookLoading(query: query));
    } else {
      emit(SearchBookPaginationLoading(query: query));
    }
    final result = await searchBooksUseCase.call(
      SearchCaseParams(query: query, page: pageNumber),
    );
    result.fold(
      (failure) =>
          pageNumber == 0
              ? emit(SearchBookFailure(message: failure.message, query: query))
              : emit(
                SearchBookPaginationFailure(
                  message: failure.message,
                  query: query,
                ),
              ),
      (books) => emit(
        SearchBookSuccess(
          books: books,
          query: query,
          isPagination: pageNumber != 0,
        ),
      ),
    );
  }
}
