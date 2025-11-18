import 'package:bookly/features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.titleMedium.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        SimilarBooksListview(image: image),
      ],
    );
  }
}
