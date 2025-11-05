import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_listview.dart';
import 'custom_appbar.dart';
import 'custom_book_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CustomAppBar(),
    //       SizedBox(height: 16),
    //       FeaturedListView(),
    //       SizedBox(height: 50),
    //       Text(
    //         'Best Seller',
    //         style: Styles.titleMedium.copyWith(color: Colors.white),
    //       ),
    //       SizedBox(height: 16),
    //       BestSellerListView(),
    //     ],
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 16),
                FeaturedListView(),
                SizedBox(height: 50),
                Text(
                  'Best Seller',
                  style: Styles.titleMedium.copyWith(color: Colors.white),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverFillRemaining(child: BestSellerListView()),
        ],
      ),
    );
  }
}
