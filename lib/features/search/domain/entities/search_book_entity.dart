import 'package:hive/hive.dart';
part 'search_book_entity.g.dart'; // لتوليد الكود

@HiveType(typeId: 1)
class SearchBookEntity {
  @HiveField(0)
  final String bookID;
  @HiveField(1)
  final String? bookImage;
  @HiveField(2)
  final String bookTitle;
  @HiveField(3)
  final String? bookAuthor;
  @HiveField(4)
  final num? bookRating;
  @HiveField(5)
  final String bookPrice;
  @HiveField(6)
  final String? bookLinkPreview;

  SearchBookEntity({
    required this.bookLinkPreview,
    required this.bookID,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookRating,
    required this.bookPrice,
  });
}
