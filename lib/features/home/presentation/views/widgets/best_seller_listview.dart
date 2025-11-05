import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: true,
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(4.0),
              child: CustomBestSellerItem(),
            );
          },
        ),
      ),
    );
  }
}
