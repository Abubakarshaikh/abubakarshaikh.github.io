// lib/sections/contact_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200), // Added divider
        ),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1180),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'Contact'),
                ContactContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 806),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Looking to create a fast, responsive, and user-friendly mobile app to represent your product or business? Do you need any Flutter development consultation or have any questions for me? Maybe you have some advice to share or just want to say "Hi 👋". In any case, feel free to reach out to me. I\'ll do my best to respond back promptly.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'The quickest way to contact me is via email. Let\'s build something amazing together!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 27),
          const EmailButton(),
        ],
      ),
    );
  }
}

class EmailButton extends StatefulWidget {
  const EmailButton({super.key});

  @override
  State<EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<EmailButton> {
  bool isHovered = false;

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'shaikhabubakar983@gmail.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ElevatedButton(
        onPressed: _launchEmail,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          elevation: isHovered ? 8 : 4,
          shadowColor: Colors.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          'shaikhabubakar983@gmail.com',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

// lib/sections/footer_section.dart
