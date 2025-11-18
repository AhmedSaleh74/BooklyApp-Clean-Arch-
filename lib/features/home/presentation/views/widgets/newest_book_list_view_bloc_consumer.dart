import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'newest_book_list_view.dart';

class NewestBookListViewBlocConsumer extends StatefulWidget {
  const NewestBookListViewBlocConsumer({super.key});

  @override
  State<NewestBookListViewBlocConsumer> createState() =>
      _NewestBookListViewBlocConsumerState();
}

class _NewestBookListViewBlocConsumerState
    extends State<NewestBookListViewBlocConsumer> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(books: books);
        } else if (state is NewestBooksFailure) {
          return Text(state.message);
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
