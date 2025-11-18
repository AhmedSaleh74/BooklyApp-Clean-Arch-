import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookPrice});
  final String bookPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: bookPrice,
            textColor: Colors.blue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            leftBorder: const BorderSide(color: Colors.blue, width: 2),
            topBorder: const BorderSide(color: Colors.blue, width: 2),
            bottomBorder: const BorderSide(color: Colors.blue, width: 2),
            onPressed: () {},
          ),
        ),

        Expanded(
          child: CustomButton(
            text: "Free Preview",
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            rightBorder: const BorderSide(color: Colors.blue, width: 2),
            topBorder: const BorderSide(color: Colors.blue, width: 2),
            bottomBorder: const BorderSide(color: Colors.blue, width: 2),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
