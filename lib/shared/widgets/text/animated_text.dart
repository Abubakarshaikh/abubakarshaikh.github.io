import 'package:flutter/material.dart';

class AnimatedGradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AnimatedGradientText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.secondary,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ??
            theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}