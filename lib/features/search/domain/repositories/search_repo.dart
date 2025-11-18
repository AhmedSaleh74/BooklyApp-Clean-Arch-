import 'package:bookly/features/search/domain/entities/search_book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchBookEntity>>> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}
