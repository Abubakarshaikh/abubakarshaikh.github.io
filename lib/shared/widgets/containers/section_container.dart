import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:portfolio_website/core/constants/spacing.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool addBottomBorder;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.addBottomBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        border: addBottomBorder ? Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
        ) : null,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(
          vertical: Spacing.sectionVertical,
          horizontal: Spacing.sectionHorizontal,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppConstants.maxWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}