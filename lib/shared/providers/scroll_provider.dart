import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final scrollControllerProvider = Provider<ScrollController>((ref) {
  final controller = ScrollController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

final scrollPositionProvider = StateNotifierProvider<ScrollNotifier, double>((ref) {
  return ScrollNotifier(ref.watch(scrollControllerProvider));
});

class ScrollNotifier extends StateNotifier<double> {
  final ScrollController controller;

  ScrollNotifier(this.controller) : super(0.0) {
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    state = controller.offset;
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}