class BookEntity {
  final String bookID;
  final String? bookImage;
  final String bookTitle;
  final String? bookAuthor;
  final num? bookRating;
  final num? bookPrice;

  BookEntity({
    required this.bookID,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookRating,
    required this.bookPrice,
  });
}
