import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationBarProvider = StateProvider<int>((ref) => 0);

final pageControllerProvider = Provider<PageController>((ref) {
  final initialPage = ref.watch(bottomNavigationBarProvider);
  return PageController(initialPage: initialPage);
});
