import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const SizedBox(height: 43),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
              ),
              child: const CustomBookImage(),
            ),
          ),
          const SizedBox(height: 43),
          Text(
            'The Jungle Book',
            style: Styles.titleMedium.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text('Rudyard Kipling', style: Styles.caption),
          const SizedBox(height: 18),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 37),
          const BooksAction(),
          const SizedBox(height: 37),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.titleMedium.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: SimilarBooksListview()),
        ],
      ),
    );
  }
}
