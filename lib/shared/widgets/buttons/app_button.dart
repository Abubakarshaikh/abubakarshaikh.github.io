import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:portfolio_website/core/constants/spacing.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool showArrow;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.showArrow = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: AppConstants.defaultAnimationDuration,
        transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
        child: widget.type == ButtonType.primary
            ? ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.p32,
                    vertical: Spacing.p20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _buildButtonContent(theme),
              )
            : OutlinedButton(
                onPressed: widget.onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  side: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.p32,
                    vertical: Spacing.p20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _buildButtonContent(theme),
              ),
      ),
    );
  }

  Widget _buildButtonContent(ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, size: 20),
          const SizedBox(width: Spacing.p8),
        ],
        Text(
          widget.text,
          style: theme.textTheme.titleMedium?.copyWith(
            color: widget.type == ButtonType.primary
                ? Colors.white
                : theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (widget.showArrow) ...[
          const SizedBox(width: Spacing.p8),
          const Icon(Icons.arrow_forward_rounded, size: 20),
        ],
      ],
    );
  }
}

enum ButtonType { primary, secondary }