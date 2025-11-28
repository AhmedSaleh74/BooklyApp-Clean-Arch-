import 'package:hive/hive.dart';

part 'book_entity.g.dart'; // لتوليد الكود

@HiveType(typeId: 0)
class BookEntity {
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

  BookEntity({
    required this.bookID,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookRating,
    required this.bookPrice,
    required this.bookLinkPreview,
  });
}
