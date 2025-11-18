import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_newest_book_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: BookListViewItem(
            bookTitle: books[index].bookTitle,
            bookAuthor: books[index].bookAuthor ?? '',
            bookPrice: books[index].bookPrice,
            bookRating: books[index].bookRating,
            bookImage: books[index].bookImage ?? '',
          ),
        );
      },
    );
  }
}
