import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'custom_newest_book_item.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  bool isLoadingMore = false;
  int nextPage = 1;
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      final threshold = maxScroll * 0.7;

      if (currentScroll >= threshold) {
        if (!isLoadingMore) {
          isLoadingMore = true;
          await context.read<NewestBooksCubit>().getNewestBooks(
            pageNumber: nextPage++,
          );
          isLoadingMore = false;
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: BookListViewItem(
            bookTitle: widget.books[index].bookTitle,
            bookAuthor: widget.books[index].bookAuthor ?? '',
            bookPrice: widget.books[index].bookPrice,
            bookRating: widget.books[index].bookRating,
            bookImage: widget.books[index].bookImage ?? '',
            books: widget.books[index],
          ),
        );
      },
    );
  }
}
