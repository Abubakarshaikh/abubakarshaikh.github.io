// lib/sections/work_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/section_title.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1180),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(title: 'My Work'),
                const SizedBox(height: 40),
                ...workProjects.asMap().entries.map(
                      (entry) => RevealProjectCard(
                        project: entry.value,
                        isReversed:
                            entry.key.isEven, // Changed from isOdd to isEven
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RevealProjectCard extends StatefulWidget {
  final ProjectData project;
  final bool isReversed;

  const RevealProjectCard({
    super.key,
    required this.project,
    this.isReversed = false,
  });

  @override
  State<RevealProjectCard> createState() => _RevealProjectCardState();
}

class _RevealProjectCardState extends State<RevealProjectCard> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 2000),
      opacity: isVisible ? 1.0 : 0.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        transform: Matrix4.translationValues(
          0,
          isVisible ? 0 : 80,
          0,
        ),
        margin: const EdgeInsets.only(bottom: 180),
        child: ProjectCard(
          project: widget.project,
          isReversed: widget.isReversed,
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectData project;
  final bool isReversed;

  const ProjectCard({
    super.key,
    required this.project,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectImage(imageUrl: project.imageUrl),
          const SizedBox(height: 30),
          ProjectInfo(project: project),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isReversed) ...[
          ProjectInfo(project: project),
          const SizedBox(width: 100),
          Expanded(child: ProjectImage(imageUrl: project.imageUrl)),
        ] else ...[
          Expanded(child: ProjectImage(imageUrl: project.imageUrl)),
          const SizedBox(width: 100),
          ProjectInfo(project: project),
        ],
      ],
    );
  }
}

class ProjectInfo extends StatelessWidget {
  final ProjectData project;

  const ProjectInfo({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          ...project.description.map((text) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: project.technologies
                .map(
                  (tech) => Chip(label: Text(tech)),
                )
                .toList(),
          ),
          if (project.siteUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {}, // Add URL launcher
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text('Visit Site →'),
              ),
            ),
        ],
      ),
    );
  }
}

class ProjectImage extends StatefulWidget {
  final String imageUrl;

  const ProjectImage({super.key, required this.imageUrl});

  @override
  State<ProjectImage> createState() => _ProjectImageState();
}

class _ProjectImageState extends State<ProjectImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 50,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class ProjectData {
  final String title;
  final List<String> description;
  final List<String> technologies;
  final String imageUrl;
  final String? siteUrl;

  const ProjectData({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    this.siteUrl,
  });
}

final List<ProjectData> workProjects = [
  const ProjectData(
    title: 'Salesflo Core',
    description: [
      "Salesflo Core's streamlines order booking, guiding sales reps and managing promotions. It equips them with store data for optimal orders and insights to drive sales growth.",
      "Download it now to experience a seamless and user-friendly mobile app.",
    ],
    technologies: [
      'Flutter dart',
      'RESTful API',
      'Localization',
      'MVP - Architecture',
      'Drift - SQL Local Storage',
      'Bloc - State Management',
    ],
    imageUrl: 'assets/images/salesflo.webp',
    siteUrl:
        'https://play.google.com/store/apps/details?id=com.retailistan.salesflo',
  ),
  const ProjectData(
    title: 'Synapp Messaging',
    description: [
      "Synapp Messaging is a secure messaging app for healthcare professionals. It offers encrypted communication, verified user registration, and a directory to find colleagues, all to improve collaboration and patient care.",
      "Download it now to experience a seamless and user-friendly mobile app.",
    ],
    technologies: [
      'Flutter dart',
      'Push Notification',
      'Localization',
      'Feature-First - Architecture',
      'Hive & Isar - NoSql Local Storage',
      'Riverpod - State Management',
    ],
    imageUrl: 'assets/images/synapp.webp',
    siteUrl: 'https://play.google.com/store/apps/details?id=com.synapp.app',
  ),
  const ProjectData(
    title: 'CandyHub: Sweet Marketplace',
    description: [
      "CandyHub: Wholesale candy for everyone. Browse vast selection, find classics & new treats. User-friendly app, fast shipping, top brands - your one-stop candy shop!",
      "Download it now to experience a seamless and user-friendly mobile app.",
    ],
    technologies: [
      'Flutter dart',
      'Firebase',
      'Hive - NoSql Local Storage',
      'Localization',
      'Feature-First - Architecture',
      'Riverpod - state management',
    ],
    imageUrl: 'assets/images/candy.webp',
    siteUrl:
        'https://play.google.com/store/apps/details?id=com.abubakar.candyhub',
  ),
  const ProjectData(
    title: 'Inversa',
    description: [
      "Inversa is a loyalty program app for stores like OXXO and Volaris. Earn points for purchases, redeem them for discounts or rewards, and discover exclusive deals..",
      "Download it now to experience a seamless and user-friendly mobile app.",
    ],
    technologies: [
      'Flutter dart',
      'Firebase',
      'Localization',
      'Feature-First - Architecture',
      'Hive - NoSql Local Storage',
      'Riverpod - State Management',
    ],
    imageUrl: 'assets/images/inversa.webp',
    siteUrl: null,
  ),
  const ProjectData(
    title: 'Tether',
    description: [
      "Find and book trusted local vets, groomers, walkers, and pet stores - all in one app. Pet owners can manage appointments, order supplies, and connect with a pet care community. Providers can showcase services, manage schedules, and grow their business.",
      "Download it now to experience a seamless and user-friendly mobile app.",
    ],
    technologies: [
      'Flutter dart',
      'Localization',
      'Firebase',
      'Feature-First - Architecture',
      'Hive - NoSql Local Storage',
      'Riverpod - State Management',
    ],
    imageUrl: 'assets/images/tether.webp',
    siteUrl: null,
  ),
  const ProjectData(
    title: 'Ninecoin: marketplace for the digital currency',
    description: [
      "The 'ninecoin app' is a marketplace for the digital currency 'ninecoin'.",
      "Enabling users to buy, sell, and exchange it with other cryptocurrencies or fiat currencies.",
    ],
    technologies: [
      'Flutter UI',
      'Clean Architecture',
      'Localization',
      'Animation',
    ],
    imageUrl: 'assets/images/coin.webp',
    siteUrl: null,
  ),
  const ProjectData(
    title: 'Vicofinanzas: finance management',
    description: [
      "Vicofinanzas is a finance management app for companies.",
      "It offers tools for expense tracking, invoicing, financial reporting, and budgeting.",
    ],
    technologies: [
      'Flutter Dart',
      'API Integration with HTTP',
      'Localization',
      'Getx - state management',
    ],
    imageUrl: 'assets/images/vico.webp',
    siteUrl: null,
  ),
  const ProjectData(
    title: 'Pimeraplanta: simplifies employee time-tracking and approval',
    description: [
      "Pimeraplanta is an app that simplifies employee time-tracking and approval, streamlining company management with a centralized platform.",
    ],
    technologies: [
      'Flutter Dart',
      'Getx - state management',
      'Localization',
      'API Integration with dio',
    ],
    imageUrl: 'assets/images/pimera.webp',
    siteUrl: null,
  ),
];
