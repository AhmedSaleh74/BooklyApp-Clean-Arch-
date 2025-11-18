import 'package:flutter/material.dart';

import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/views/widgets/custom_newest_book_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CustomSearchTextField(),
          Text('Search Result', style: Theme.of(context).textTheme.titleMedium),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: BookListViewItem(
            bookTitle: '',
            bookAuthor: '',
            bookPrice: '',
            bookImage: '',
            books: BookEntity(
              bookID: '',
              bookImage: '',
              bookTitle: '',
              bookAuthor: '',
              bookRating: null,
              bookPrice: '',
            ),
          ),
        );
      },
    );
  }
}
