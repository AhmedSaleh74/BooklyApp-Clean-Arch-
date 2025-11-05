import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment});

  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      spacing: 8,
      children: [
        Icon(Icons.star, color: Colors.yellow),
        Text('4.9', style: Styles.whiteText),
        Text('(239)', style: Styles.caption),
      ],
    );
  }
}
