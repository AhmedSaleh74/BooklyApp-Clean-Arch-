import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookPrice,
    this.bookRating,
    required this.bookImage,
  });
  final String bookImage;
  final String bookTitle;
  final String bookAuthor;
  final String bookPrice;
  final num? bookRating;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: CachedNetworkImage(
                imageUrl: bookImage,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => const Center(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                errorWidget:
                    (context, url, error) =>
                        const Center(child: Icon(Icons.broken_image, size: 50)),
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookTitle,
                    style: Styles.titleMedium.copyWith(color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    bookAuthor,
                    style: Styles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookPrice, style: Styles.highlighted),
                      BookRating(bookRating: bookRating ?? 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
