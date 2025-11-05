import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_listview_item.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        const SizedBox(height: 43),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .36),
            child: const CustomBookImage(),
          ),
        ),
        const SizedBox(height: 43),
        Text(
          'The Jungle Book',
          style: Styles.titleMedium.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text('Rudyard Kipling', style: Styles.caption),
        BookRating(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
