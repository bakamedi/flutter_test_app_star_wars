import 'package:flutter/material.dart';

import '../controller/home_provider.dart';

bool bottomScrollAction(Object? scrollEndNotification) {
  final homeController = homeProvider.read;
  final isEmpty = homeController.charactersFilters.isEmpty;
  final position = homeController.scrollController.position;
  if (isEmpty) {
    if (scrollEndNotification is ScrollEndNotification) {
      final offset = position.pixels;
      final maxScrollExtent = position.maxScrollExtent;
      if (offset >= maxScrollExtent) {
        homeController.load(
          homeController.state.page + 1,
          retry: true,
        );
      }
    }
  }
  return true;
}
