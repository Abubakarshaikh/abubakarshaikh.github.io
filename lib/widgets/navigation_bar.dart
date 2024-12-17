import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final Function(String) onNavigate;

  const NavigationBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive behavior
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate spacing based on screen width
    double horizontalSpacing = 60;
    double horizontalPadding = 20;

    // Adjusting spacing for different screen sizes
    if (screenWidth <= 1340) {
      horizontalPadding = 60;
    }
    if (screenWidth <= 600) {
      horizontalPadding = 30;
    }
    if (screenWidth <= 500) {
      horizontalSpacing = 30; // Reduced spacing between links
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 1180),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // For screens <= 500px, use space-between instead of flex-end
        mainAxisAlignment: screenWidth <= 500
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          _NavLink(
            title: 'Work',
            onTap: () => onNavigate('work'),
          ),
          SizedBox(width: horizontalSpacing),
          _NavLink(
            title: 'Clients',
            onTap: () => onNavigate('clients'),
          ),
          SizedBox(width: horizontalSpacing),
          _NavLink(
            title: 'About',
            onTap: () => onNavigate('about'),
          ),
          SizedBox(width: horizontalSpacing),
          _NavLink(
            title: 'Contact',
            onTap: () => onNavigate('contact'),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({
    required this.title,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive font size
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double fontSize = 23;
    if (screenWidth <= 1000) {
      fontSize = 20; // Smaller font size for smaller screens
    }
    if (screenWidth <= 400) {
      fontSize = 18; // Even smaller for very small screens
    }

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 130,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(top: 5),
                height: 1,
                width: isHovered ? 100 : 0,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
