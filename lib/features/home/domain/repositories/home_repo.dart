import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<BookEntity> getFeaturedBooks();
  Future<List<BookEntity>> getBestSellerBooks();
}
