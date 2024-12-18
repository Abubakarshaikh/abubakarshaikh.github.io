import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/constants/spacing.dart';
import 'package:portfolio_website/core/responsive/responsive_wrapper.dart';
import 'package:portfolio_website/features/about/presentation/widgets/expertise_card.dart';
import 'package:portfolio_website/shared/widgets/containers/section_container.dart';
import 'package:portfolio_website/shared/widgets/text/animated_text.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: Spacing.p60),
          AboutContent(),
        ],
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      mobile: AboutContentMobile(),
      desktop: AboutContentDesktop(),
    );
  }
}

class AboutContentDesktop extends StatelessWidget {
  const AboutContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnimatedGradientText(
                    text: "👋 Hello, I'm Abubakar Shaikh",
                  ),
                  const SizedBox(height: Spacing.p24),
                  Text(
                    "Transforming ideas into seamless mobile experiences",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: Spacing.p16),
                  Text(
                    "As a passionate Flutter developer based in Karachi, Pakistan, I specialize in creating beautiful, high-performance mobile applications that make a difference. With over 5 years of experience, I've mastered the art of turning complex problems into elegant solutions.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Spacing.p40),
            // Profile Image
            const ProfileImage(),
          ],
        ),
        const SizedBox(height: Spacing.p80),

        // Expertise Grid
        const ExpertiseGrid(),

        const SizedBox(height: Spacing.p60),

        // Skills Section
        const SkillsSection(),
      ],
    );
  }
}

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileImage(),
        const SizedBox(height: Spacing.p32),
        const AnimatedGradientText(
          text: "👋 Hello, I'm Abubakar Shaikh",
        ),
        const SizedBox(height: Spacing.p16),
        Text(
          "Transforming ideas into seamless mobile experiences",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: Spacing.p16),
        Text(
          "As a passionate Flutter developer based in Karachi, Pakistan, I specialize in creating beautiful, high-performance mobile applications that make a difference. With over 5 years of experience, I've mastered the art of turning complex problems into elegant solutions.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
        ),
        const SizedBox(height: Spacing.p40),
        const ExpertiseGridMobile(),
        const SizedBox(height: Spacing.p40),
        const SkillsSection(),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 120,
          color: Colors.black26,
        ),
      ),
    );
  }
}
