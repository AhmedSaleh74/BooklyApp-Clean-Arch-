import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .28,
      height: MediaQuery.sizeOf(context).height * .32,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsData.testImage),
          fit: BoxFit.cover,
        ),
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
