import 'package:flutter/material.dart' hide NavigationBar;
import 'package:portfolio_website/widgets/navigation_bar.dart';

class HeaderSection extends StatelessWidget {
  final Function(String) onNavigate;

  const HeaderSection({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/header_image.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.9),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          NavigationBar(
            onNavigate: onNavigate,
          ),
          Expanded(
            child: HeaderContent(onNavigate: onNavigate),
          ),
        ],
      ),
    );
  }
}

// class NavigationBar extends StatelessWidget {
//   final Function(String) onNavigate;

//   const NavigationBar({super.key, required this.onNavigate});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           NavLink(
//             title: 'Work',
//             onTap: () => onNavigate('work'),
//           ),
//           const SizedBox(width: 60),
//           NavLink(
//             title: 'Clients',
//             onTap: () => onNavigate('clients'),
//           ),
//           const SizedBox(width: 60),
//           NavLink(
//             title: 'About',
//             onTap: () => onNavigate('about'),
//           ),
//           const SizedBox(width: 60),
//           NavLink(
//             title: 'Contact',
//             onTap: () => onNavigate('contact'),
//           ),
//         ],
//       ),
//     );
//   }
// }

class NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavLink({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _NavLinkContent(title: title),
    );
  }
}

class _NavLinkContent extends StatefulWidget {
  final String title;

  const _NavLinkContent({required this.title});

  @override
  State<_NavLinkContent> createState() => _NavLinkContentState();
}

class _NavLinkContentState extends State<_NavLinkContent> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 1,
            width: isHovered ? 100 : 0,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final Function(String) onNavigate;

  const HeaderContent({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1180),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi! I'm Abubakar",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 540),
            child: Text(
              "Flutter Architect & Mobile Dev Expert. Proficient in state management using — BloC, Riverpod, and GetX, and skilled in API integration with Firebase, RESTful, GraphQL and WebRTC.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () => onNavigate('contact'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              'Need Help? Get in touch ...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
