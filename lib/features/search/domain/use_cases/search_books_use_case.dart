import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/search/domain/repositories/search_repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/book_search_entity.dart';

class SearchBooksUseCase extends UseCase<List<BookSearchEntity>, String> {
  final SearchRepo searchRepo;

  SearchBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookSearchEntity>>> call([
    String parameter = '',
  ]) async {
    return await searchRepo.searchBooks(parameter);
  }
}
