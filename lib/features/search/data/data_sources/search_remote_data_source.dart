import 'package:bookly/constants.dart';
import 'package:bookly/features/search/domain/entities/search_book_entity.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../models/search_book_model/search_book_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchBookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<SearchBookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    final data = await apiService.get(endPoint: 'volumes?q=$query');

    List<SearchBookEntity> books = getBooksList(data);

    saveSearchBooksData(books: books, boxName: kSearchBox);
    return books;
  }

  List<SearchBookEntity> getBooksList(Map<String, dynamic> data) {
    final List<SearchBookEntity> books = [];

    for (var bookMap in data['items']) {
      final bookModel = SearchBookModel.fromJson(bookMap);
      books.add(bookModel.toEntity()); // تحويل صريح لـ BookEntity
    }
    return books;
  }
}
