import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double elevation;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? color;

  const HoverCard({
    super.key,
    required this.child,
    this.elevation = 0,
    this.borderRadius,
    this.border,
    this.color,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: AppConstants.defaultAnimationDuration,
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.02 : 1.0)
          ..translate(0.0, isHovered ? -5.0 : 0.0),
        decoration: BoxDecoration(
          color: widget.color ?? Theme.of(context).colorScheme.surface,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          border: widget.border,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.1 : 0.05),
              blurRadius: isHovered ? 30 : 20,
              offset: Offset(0, isHovered ? 10 : 5),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
