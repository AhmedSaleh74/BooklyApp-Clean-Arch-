import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 43),
                const BookDetailsSection(),
                const SizedBox(height: 37),
                const SimilarBooksSection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
