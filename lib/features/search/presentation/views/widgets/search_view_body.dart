import 'package:flutter/material.dart';

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
        return const Padding(
          padding: EdgeInsets.all(4.0),
          child: BookListViewItem(
            bookTitle: '',
            bookAuthor: '',
            bookPrice: '',
            bookImage: '',
          ),
        );
      },
    );
  }
}
