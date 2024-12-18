import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/widgets/cards/hover_card.dart';

class ScrollToTopButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScrollToTopButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 32,
      child: HoverCard(
        borderRadius: BorderRadius.circular(30),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.keyboard_arrow_up_rounded),
          tooltip: 'Scroll to top',
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}