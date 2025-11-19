import 'package:flutter/material.dart';

void setupPagination({
  required ScrollController controller,
  required Future<void> Function(int page) loadPage,
}) {
  int nextPage = 1;
  bool isLoading = false;

  controller.addListener(() async {
    if (!controller.hasClients) return;

    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;
    final threshold = maxScroll * 0.7;

    if (currentScroll >= threshold && !isLoading) {
      isLoading = true;
      await loadPage(nextPage++);
      isLoading = false;
    }
  });
}
