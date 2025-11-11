import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> getFeaturedBooks() async {
    try {
      final booksList = homeLocalDataSource.getFeaturedBooks();
      final books = await homeRemoteDataSource.getFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      return right(books.cast<BookEntity>());
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }
}
