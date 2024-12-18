import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/constants/spacing.dart';
import 'package:portfolio_website/core/responsive/responsive_wrapper.dart';
import 'package:portfolio_website/shared/widgets/buttons/app_button.dart';
import 'package:portfolio_website/shared/widgets/cards/hover_card.dart';
import 'package:portfolio_website/shared/widgets/containers/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends ConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            width: 120,
            height: 2,
            margin: const EdgeInsets.symmetric(vertical: Spacing.p20),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: Spacing.p40),
          const ResponsiveWrapper(
            mobile: ContactContentMobile(),
            desktop: ContactContentDesktop(),
          ),
        ],
      ),
    );
  }
}

class ContactContentDesktop extends StatelessWidget {
  const ContactContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactDescription(),
              SizedBox(height: Spacing.p40),
              ContactEmail(),
              SizedBox(height: Spacing.p40),
              SocialLinks(),
            ],
          ),
        ),
        SizedBox(width: Spacing.p64),
        Expanded(
          flex: 2,
          child: ContactIllustration(),
        ),
      ],
    );
  }
}

class ContactContentMobile extends StatelessWidget {
  const ContactContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactDescription(),
        SizedBox(height: Spacing.p32),
        ContactEmail(),
        SizedBox(height: Spacing.p32),
        SocialLinks(),
        SizedBox(height: Spacing.p40),
        ContactIllustration(),
      ],
    );
  }
}

class ContactDescription extends StatelessWidget {
  const ContactDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 806),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's Build Something Amazing Together",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: Spacing.p24),
          Text(
            'Looking to create a fast, responsive, and user-friendly mobile app to represent your product or business? Do you need any Flutter development consultation or have any questions for me? Maybe you have some advice to share or just want to say "Hi 👋".',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: Spacing.p16),
          Text(
            'The quickest way to contact me is via email. Let\'s build something amazing together!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );
  }
}

class ContactEmail extends StatelessWidget {
  const ContactEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: Spacing.p16),
        const EmailButton(),
      ],
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
    return AppButton(
      text: 'shaikhabubakar983@gmail.com',
      onPressed: _launchEmail,
      type: ButtonType.primary,
      icon: Icons.email_outlined,
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Media',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: Spacing.p16),
        const Wrap(
          spacing: Spacing.p16,
          runSpacing: Spacing.p16,
          children: [
            SocialButton(
              platform: 'GitHub',
              icon: Icons.code,
              url: 'https://github.com/Abubakarshaikh',
            ),
            SocialButton(
              platform: 'LinkedIn',
              icon: Icons.code,
              url: 'https://www.linkedin.com/in/shaikhabubakar/',
            ),
            SocialButton(
              platform: 'Twitter',
              icon: Icons.flutter_dash,
              url: 'https://twitter.com/abubakrshykh',
            ),
            SocialButton(
              platform: 'YouTube',
              icon: Icons.play_circle_outline,
              url: 'https://www.youtube.com/@AbubakarShaikh',
            ),
          ],
        ),
      ],
    );
  }
}

class SocialButton extends StatefulWidget {
  final String platform;
  final IconData icon;
  final String url;

  const SocialButton({
    super.key,
    required this.platform,
    required this.icon,
    required this.url,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    if (await canLaunchUrl(Uri.parse(widget.url))) {
      await launchUrl(Uri.parse(widget.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _launchURL,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.p16,
              vertical: Spacing.p12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: Spacing.p8),
                Text(
                  widget.platform,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactIllustration extends StatelessWidget {
  const ContactIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Icon(
          Icons.email_outlined,
          size: 120,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
    );
  }
}
