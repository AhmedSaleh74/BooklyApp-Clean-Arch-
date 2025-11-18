import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/search_case_params.dart';
import 'package:bookly/features/search/domain/repositories/search_repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/search_book_entity.dart';

class SearchBooksUseCase
    extends UseCase<List<SearchBookEntity>, SearchCaseParams> {
  final SearchRepo searchRepo;

  SearchBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchBookEntity>>> call(
    SearchCaseParams parameter,
  ) async {
    return await searchRepo.searchBooks(
      query: parameter.query,
      pageNumber: parameter.page,
    );
  }
}
