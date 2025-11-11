import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> getFeaturedBooks();
  Future<List<BookEntity>> getNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> getFeaturedBooks() async {
    final data = await apiService.get(endPoint: 'volumes?q=sport');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> getNewestBooks() async {
    final data = await apiService.get(
      endPoint: 'volumes?q=programming&Sorting=newest',
    );

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    final List<BookEntity> books = [];

    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap) as BookEntity);
    }
    return books;
  }
}
