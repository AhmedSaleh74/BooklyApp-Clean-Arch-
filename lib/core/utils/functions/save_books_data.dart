import 'package:hive/hive.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

void saveBooksData({
  required final List<BookEntity> books,
  required final String boxName,
}) {
  final box = Hive.box(boxName);
  box.addAll(books);
}
