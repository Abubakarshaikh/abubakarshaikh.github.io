import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/spacing.dart';
import 'package:portfolio_website/shared/widgets/cards/hover_card.dart';
import 'package:portfolio_website/shared/widgets/chips/skill_chip.dart';

class ExpertiseGrid extends StatelessWidget {
  const ExpertiseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: Spacing.p24,
      crossAxisSpacing: Spacing.p24,
      childAspectRatio: 1.1,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ExpertiseCard(
          title: "Mobile Development",
          description:
              "Crafting intuitive and performant Flutter applications with pixel-perfect UI and smooth animations.",
          icon: Icons.smartphone_rounded,
        ),
        ExpertiseCard(
          title: "Architecture Expert",
          description:
              "Implementing clean architecture with modern state management solutions like BLoC, Provider, and Riverpod.",
          icon: Icons.architecture_rounded,
        ),
        ExpertiseCard(
          title: "Full-Stack Integration",
          description:
              "Seamlessly connecting mobile apps with Firebase, REST APIs, and GraphQL backends for robust solutions.",
          icon: Icons.integration_instructions_rounded,
        ),
      ],
    );
  }
}

class ExpertiseGridMobile extends StatelessWidget {
  const ExpertiseGridMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpertiseCard(
          title: "Mobile Development",
          description:
              "Crafting intuitive and performant Flutter applications with pixel-perfect UI and smooth animations.",
          icon: Icons.smartphone_rounded,
        ),
        SizedBox(height: Spacing.p24),
        ExpertiseCard(
          title: "Architecture Expert",
          description:
              "Implementing clean architecture with modern state management solutions like BLoC, Provider, and Riverpod.",
          icon: Icons.architecture_rounded,
        ),
        SizedBox(height: Spacing.p24),
        ExpertiseCard(
          title: "Full-Stack Integration",
          description:
              "Seamlessly connecting mobile apps with Firebase, REST APIs, and GraphQL backends for robust solutions.",
          icon: Icons.integration_instructions_rounded,
        ),
      ],
    );
  }
}

class ExpertiseCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ExpertiseCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.p24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(Spacing.p12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: Spacing.p20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: Spacing.p12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.p32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Technical Expertise",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: Spacing.p24),
          const Wrap(
            spacing: Spacing.p12,
            runSpacing: Spacing.p12,
            children: [
              SkillChip(label: "Flutter Development", icon: Icons.code),
              SkillChip(label: "State Management", icon: Icons.architecture),
              SkillChip(label: "RESTful APIs", icon: Icons.api),
              SkillChip(label: "Firebase", icon: Icons.cloud),
              SkillChip(label: "UI/UX Design", icon: Icons.design_services),
              SkillChip(label: "Clean Architecture", icon: Icons.architecture),
              SkillChip(label: "Performance Optimization", icon: Icons.speed),
              SkillChip(label: "Cross-Platform", icon: Icons.devices),
            ],
          ),
        ],
      ),
    );
  }
}
