import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder:
              (context, url) =>
                  const Center(child: FeaturedBooksListViewLoadingIndicator()),
          errorWidget:
              (context, url, error) =>
                  const Center(child: Icon(Icons.broken_image, size: 50)),
        ),
      ),
    );
  }
}
