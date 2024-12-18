import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/responsive/responsive_wrapper.dart';
import 'package:portfolio_website/core/constants/spacing.dart';

class NavBar extends ConsumerWidget {
  final Function(String) onNavigate;

  const NavBar({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveWrapper(
      mobile: NavBarMobile(onNavigate: onNavigate),
      desktop: NavBarDesktop(onNavigate: onNavigate),
    );
  }
}

class NavBarDesktop extends StatelessWidget {
  final Function(String) onNavigate;

  const NavBarDesktop({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.p24),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "AS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              NavLink(
                title: 'Work',
                onTap: () => onNavigate('projects'),
              ),
              const SizedBox(width: Spacing.p40),
              NavLink(
                title: 'About',
                onTap: () => onNavigate('about'),
              ),
              const SizedBox(width: Spacing.p40),
              NavLink(
                title: 'Contact',
                onTap: () => onNavigate('contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarMobile extends StatelessWidget {
  final Function(String) onNavigate;

  const NavBarMobile({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "AS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => MobileNavMenu(onNavigate: onNavigate),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MobileNavMenu extends StatelessWidget {
  final Function(String) onNavigate;

  const MobileNavMenu({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.p24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Spacing.p8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: Spacing.p24),
          MobileNavLink(
            title: 'Work',
            icon: Icons.work_outline,
            onTap: () {
              Navigator.pop(context);
              onNavigate('projects');
            },
          ),
          const SizedBox(height: Spacing.p16),
          MobileNavLink(
            title: 'About',
            icon: Icons.person_outline,
            onTap: () {
              Navigator.pop(context);
              onNavigate('about');
            },
          ),
          const SizedBox(height: Spacing.p16),
          MobileNavLink(
            title: 'Contact',
            icon: Icons.email_outlined,
            onTap: () {
              Navigator.pop(context);
              onNavigate('contact');
            },
          ),
          const SizedBox(height: Spacing.p24),
        ],
      ),
    );
  }
}

class NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavLink({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isHovered ? 30 : 0,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class MobileNavLink extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MobileNavLink({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}