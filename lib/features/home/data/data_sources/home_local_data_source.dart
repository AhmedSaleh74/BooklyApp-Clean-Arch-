import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks({int pageNumber = 0});
  List<BookEntity> getNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getFeaturedBooks({int pageNumber = 0}) {
    final startIndex = pageNumber * 10;
    final endIndex = (pageNumber + 1) * 10;
    final box = Hive.box<BookEntity>(kFeaturedBox);
    final length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    print('$pageNumber ;;;;;;;;;;;;;;;;;;;;;;;;');
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> getNewestBooks() {
    final box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
