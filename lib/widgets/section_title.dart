import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Alignment alignment;

  const SectionTitle({
    required this.title,
    this.alignment = Alignment.centerLeft, // Changed default to left
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Always start from left
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Container(
          width: 120,
          height: 2,
          margin: const EdgeInsets.only(top: 20, bottom: 25),
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
