import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_book_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CustomSearchTextField(
            searchController: searchController,
            onChanged: (value) {
              context.read<SearchBookCubit>().searchBooks(query: value);
            },
          ),
          Text('Search Result', style: Theme.of(context).textTheme.titleMedium),
          Expanded(child: SearchResultListViewBlocConsumer()),
        ],
      ),
    );
  }
}
