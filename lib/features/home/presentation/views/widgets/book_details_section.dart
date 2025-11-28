import 'package:bookly/core/utils/functions/open_url.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
          ),
          child: CustomBookImage(image: book.bookImage ?? ''),
        ),
        const SizedBox(height: 43),
        Text(
          book.bookTitle,
          style: Styles.titleMedium.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(book.bookAuthor ?? 'UnKnown', style: Styles.caption),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          bookRating: book.bookRating,
        ),
        const SizedBox(height: 37),
        BooksAction(
          bookPrice: book.bookPrice,
          onPress: () async {
            openUrl(book.bookLinkPreview);
          },
        ),
      ],
    );
  }
}
