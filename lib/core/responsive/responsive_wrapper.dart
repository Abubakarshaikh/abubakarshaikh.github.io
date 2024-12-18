import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWrapper({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.tabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint &&
      MediaQuery.of(context).size.width < AppConstants.desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.desktopBreakpoint) {
          return desktop;
        }

        if (constraints.maxWidth >= AppConstants.tabletBreakpoint) {
          return tablet ?? desktop;
        }

        return mobile;
      },
    );
  }
}
