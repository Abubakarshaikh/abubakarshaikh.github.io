// lib/features/footer/presentation/sections/footer_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/constants/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.p48,
      ),
      color: Theme.of(context).colorScheme.primary,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FooterLinks(),
          SizedBox(height: Spacing.p24),
          Copyright(),
        ],
      ),
    );
  }
}

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FooterLink(
          title: 'GitHub',
          url: 'https://github.com/Abubakarshaikh',
          icon: Icons.code,
        ),
        SizedBox(width: Spacing.p32),
        FooterLink(
          title: 'LinkedIn',
          url: 'https://www.linkedin.com/in/shaikhabubakar/',
          icon: Icons.code,
        ),
        SizedBox(width: Spacing.p32),
        FooterLink(
          title: 'Twitter',
          url: 'https://twitter.com/abubakrshykh',
          icon: Icons.flutter_dash,
        ),
        SizedBox(width: Spacing.p32),
        FooterLink(
          title: 'YouTube',
          url: 'https://www.youtube.com/@AbubakarShaikh',
          icon: Icons.play_circle_outline,
        ),
      ],
    );
  }
}

class FooterLink extends StatefulWidget {
  final String title;
  final String url;
  final IconData icon;

  const FooterLink({
    super.key,
    required this.title,
    required this.url,
    required this.icon,
  });

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(Uri.parse(widget.url));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: Spacing.p8),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '© ${DateTime.now().year} Abubakar Shaikh. All rights reserved.',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.7),
          ),
    );
  }
}
