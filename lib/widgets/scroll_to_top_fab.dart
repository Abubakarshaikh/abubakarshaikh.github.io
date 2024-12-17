import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollToTopFAB extends StatefulWidget {
  final VoidCallback onPressed;

  const ScrollToTopFAB({
    required this.onPressed,
    super.key,
  });

  @override
  State<ScrollToTopFAB> createState() => _ScrollToTopFABState();
}

class _ScrollToTopFABState extends State<ScrollToTopFAB> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 57,
          width: 57,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0.55 : 0.25),
                blurRadius: isHovered ? 50 : 30,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
              child: SvgPicture.asset(
                'assets/images/arrow.svg',
                height: 42,
                width: 42,
              ),
            ),
        ),
      ),
    );
  }
}