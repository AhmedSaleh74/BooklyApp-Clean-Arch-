import 'package:bookly/features/search/presentation/views/widgets/search_book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/functions/setup_pagination.dart';
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
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    setupPagination(
      controller: _scrollController,
      loadPage:
          (page) => context.read<SearchBookCubit>().searchBooks(
            pageNumber: page,
            query: widget.query,
          ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBookCubit>().searchBooks(
        pageNumber: 1,
        query: widget.query,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
