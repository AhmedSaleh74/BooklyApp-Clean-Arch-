import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> getFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> getNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> getFeaturedBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      endPoint: 'volumes?q=programming&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> getNewestBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      endPoint:
          'volumes?q=programming&Sorting=newest&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    final List<BookEntity> books = [];

    for (var bookMap in data['items']) {
      final bookModel = BookModel.fromJson(bookMap);
      books.add(bookModel.toEntity()); // تحويل صريح لـ BookEntity
    }
    return books;
  }
}
