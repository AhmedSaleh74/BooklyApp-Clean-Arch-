import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({super.key});

  @override
  State<FeaturedListViewBlocConsumer> createState() =>
      _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState
    extends State<FeaturedListViewBlocConsumer> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(message: state.message, backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.message);
        } else {
          return Center(child: const FeaturedBooksListViewLoadingIndicator());
        }
      },
    );
  }
}
