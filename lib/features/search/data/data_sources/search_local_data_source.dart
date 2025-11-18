import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/search_book_entity.dart';

abstract class SearchLocalDataSource {
  List<SearchBookEntity> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<SearchBookEntity> searchBooks({
    required String query,
    int pageNumber = 0,
  }) {
    final startIndex = pageNumber * 10;
    final endIndex = (pageNumber + 1) * 10;
    final box = Hive.box<SearchBookEntity>(kSearchBox);
    final length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
