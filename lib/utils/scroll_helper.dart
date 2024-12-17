import 'package:flutter/material.dart';

class ScrollHelper {
  static void scrollToTop(BuildContext context) {
    Scrollable.ensureVisible(
      context.findRootAncestorStateOfType<NavigatorState>()!.context,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}