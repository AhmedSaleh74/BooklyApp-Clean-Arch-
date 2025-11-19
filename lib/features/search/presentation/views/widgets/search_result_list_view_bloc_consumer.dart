import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../domain/entities/search_book_entity.dart';
import '../../manager/search_book_cubit.dart';

class SearchResultListViewBlocConsumer extends StatefulWidget {
  const SearchResultListViewBlocConsumer({super.key});
  @override
  State<SearchResultListViewBlocConsumer> createState() =>
      _SearchResultListViewBlocConsumerState();
}

class _SearchResultListViewBlocConsumerState
    extends State<SearchResultListViewBlocConsumer> {
  final List<SearchBookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBookCubit, SearchBookState>(
      listener: (context, state) {
        if (state is SearchBookSuccess) {
          if (state.isPagination == false) {
            books.clear();
          }
          books.addAll(state.books);
        }
        if (state is SearchBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(message: state.message, backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is SearchBookSuccess ||
            state is SearchBookPaginationLoading ||
            state is SearchBookPaginationFailure) {
          return SearchResultListView(books: books, query: state.query);
        } else if (state is SearchBookFailure) {
          return Text(state.message);
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
