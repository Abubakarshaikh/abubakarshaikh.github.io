import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/models/project_model.dart';
import 'package:portfolio_website/shared/widgets/buttons/app_button.dart';
import 'package:portfolio_website/shared/widgets/cards/hover_card.dart';
import 'package:portfolio_website/shared/widgets/chips/skill_chip.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RevealProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool isReversed;

  const RevealProjectCard({
    super.key,
    required this.project,
    required this.isReversed,
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
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      opacity: isVisible ? 1.0 : 0.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
          0,
          isVisible ? 0 : 100,
          0,
        ),
        margin: const EdgeInsets.only(bottom: 120),
        child: ProjectCardDesktop(
          project: widget.project,
          isReversed: widget.isReversed,
        ),
      ),
    );
  }
}

class ProjectCardDesktop extends StatelessWidget {
  final ProjectModel project;
  final bool isReversed;

  const ProjectCardDesktop({
    super.key,
    required this.project,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(

      color: Theme.of(context).colorScheme.surface,
      border: Border.all(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isReversed) ...[
              Expanded(
                flex: 4,
                child: ProjectInfo(project: project),
              ),
              const SizedBox(width: 60),
              Expanded(
                flex: 5,
                child: ProjectImage(imageUrl: project.imageUrl),
              ),
            ] else ...[
              Expanded(
                flex: 5,
                child: ProjectImage(imageUrl: project.imageUrl),
              ),
              const SizedBox(width: 60),
              Expanded(
                flex: 4,
                child: ProjectInfo(project: project),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ProjectCardMobile extends StatelessWidget {
  final ProjectModel project;

  const ProjectCardMobile({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            child: ProjectImage(imageUrl: project.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ProjectInfo(project: project),
          ),
        ],
      ),
    );
  }
}

class ProjectInfo extends StatelessWidget {
  final ProjectModel project;

  const ProjectInfo({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.category != null)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              project.category!,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        const SizedBox(height: 16),
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),
        ...project.description.map(
          (text) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                    height: 1.6,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (var tech in project.technologies)
              SkillChip(
                label: tech,
                icon: _getIconForTechnology(tech),
              ),
          ],
        ),
        if (project.siteUrl != null || project.githubUrl != null)
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              children: [
                if (project.siteUrl != null)
                  AppButton(
                    text: 'View Project',
                    onPressed: () => launchUrlString(project.siteUrl!),
                    showArrow: true,
                  ),
                if (project.githubUrl != null) ...[
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => launchUrlString(project.githubUrl!),
                    icon: const Icon(Icons.code),
                    tooltip: 'View Source Code',
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  IconData _getIconForTechnology(String technology) {
    switch (technology.toLowerCase()) {
      case 'flutter':
      case 'flutter dart':
        return Icons.flutter_dash;
      case 'firebase':
        return Icons.local_fire_department;
      case 'api':
      case 'restful api':
      case 'rest apis':
        return Icons.api;
      case 'architecture':
      case 'clean architecture':
        return Icons.architecture;
      default:
        return Icons.code;
    }
  }
}

class ProjectImage extends StatefulWidget {
  final String imageUrl;

  const ProjectImage({
    super.key,
    required this.imageUrl,
  });

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
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.02 : 1.0)
          ..translate(0.0, isHovered ? -5.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
