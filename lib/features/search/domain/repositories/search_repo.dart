import 'package:bookly/features/search/domain/entities/book_search_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookSearchEntity>>> searchBooks(String query);
}
