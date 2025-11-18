import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/search/data/data_sources/search_local_data_source.dart';
import 'package:bookly/features/search/domain/entities/search_book_entity.dart';
import 'package:bookly/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_sources/search_remote_data_source.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl({
    required this.searchRemoteDataSource,
    required this.searchLocalDataSource,
  });
  @override
  Future<Either<Failure, List<SearchBookEntity>>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    try {
      List<SearchBookEntity> books;
      books = searchLocalDataSource.searchBooks(
        query: query,
        pageNumber: pageNumber,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await searchRemoteDataSource.searchBooks(
        query: query,
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
