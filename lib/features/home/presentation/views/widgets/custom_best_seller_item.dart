import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';
import '../../../../../core/utlis/styles.dart';

class CustomBestSellerItem extends StatelessWidget {
  const CustomBestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.testImage),
                  fit: BoxFit.cover,
                ),
                // color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Jungle Book by Rudyard Kipling The Jungle Book by Rudyard Kipling The Jungle Book by Rudyard Kipling The Jungle Book by Rudyard Kipling',
                  style: Styles.titleMedium.copyWith(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rudyard Kipling',
                  style: Styles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('19.99 EG', style: Styles.highlighted),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text('4.9', style: Styles.whiteText),
                        Text('(239)', style: Styles.caption),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
