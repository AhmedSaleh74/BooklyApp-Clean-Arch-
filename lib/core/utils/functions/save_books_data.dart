import 'package:bookly/features/search/domain/entities/search_book_entity.dart';
import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveBooksData({
  required final List<BookEntity> books,
  required final String boxName,
}) {
  final box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}

void saveSearchBooksData({
  required final List<SearchBookEntity> books,
  required final String boxName,
}) {
  final box = Hive.box<SearchBookEntity>(boxName);
  box.addAll(books);
}
