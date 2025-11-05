import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'cutom_listview_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomAppBar(), CustomListViewItem()]);
  }
}
