import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveBooksData({
  required final List<BookEntity> books,
  required final String boxName,
}) {
  final box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
