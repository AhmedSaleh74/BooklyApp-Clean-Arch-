import 'package:bookly/features/search/presentation/views/widgets/search_book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/search_book_entity.dart';
import '../../manager/search_book_cubit.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({
    super.key,
    required this.books,
    required this.query,
  });
  final List<SearchBookEntity> books;
  final String query;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
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
          await context.read<SearchBookCubit>().searchBooks(
            pageNumber: nextPage++,
            query: widget.query,
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
          child: SearchBookListViewItem(
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
