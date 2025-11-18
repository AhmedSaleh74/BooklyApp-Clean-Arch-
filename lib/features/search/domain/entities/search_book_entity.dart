class SearchBookEntity {
  final String bookID;
  final String? bookImage;
  final String bookTitle;
  final String? bookAuthor;
  final num? bookRating;
  final String bookPrice;

  SearchBookEntity({
    required this.bookID,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookRating,
    required this.bookPrice,
  });
}
