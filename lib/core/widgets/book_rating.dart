import 'package:flutter/material.dart';
import '../utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment, this.bookRating});
  final num? bookRating;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      spacing: 8,
      children: [
        Icon(Icons.star, color: Colors.yellow),
        Text(bookRating.toString(), style: Styles.whiteText),
      ],
    );
  }
}
