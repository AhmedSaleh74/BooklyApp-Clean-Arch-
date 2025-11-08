import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> getFeaturedBooks();
  Future<List<BookEntity>> getNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }
}
