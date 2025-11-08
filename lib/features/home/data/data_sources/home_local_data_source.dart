import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks();
  List<BookEntity> getNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }
}
