import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/functions/setup_pagination.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    setupPagination(
      controller: _scrollController,
      loadPage:
          (page) => context.read<FeaturedBooksCubit>().getFeaturedBooks(
            pageNumber: page,
          ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeaturedBooksCubit>().getFeaturedBooks(pageNumber: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .32,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          if (index == widget.books.length) {
            return const Center(
              child: SizedBox(width: 40, child: CircularProgressIndicator()),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CustomBookImage(image: widget.books[index].bookImage ?? ''),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
