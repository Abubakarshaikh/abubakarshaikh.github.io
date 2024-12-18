import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/responsive/responsive_wrapper.dart';
import 'package:portfolio_website/features/projects/data/providers/projects_provider.dart';
import 'package:portfolio_website/features/projects/presentation/widgets/project_card.dart';
import 'package:portfolio_website/shared/models/project_model.dart';
import 'package:portfolio_website/shared/widgets/containers/section_container.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            width: 120,
            height: 2,
            margin: const EdgeInsets.only(top: 20, bottom: 25),
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            'Some of my best work that showcases my skills and experience',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 60),
          const ProjectsList(),
        ],
      ),
    );
  }
}

class ProjectsList extends ConsumerWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);

    return ResponsiveWrapper(
      mobile: _ProjectsListMobile(projects: projects),
      desktop: _ProjectsListDesktop(projects: projects),
    );
  }
}

class _ProjectsListDesktop extends StatelessWidget {
  final List<ProjectModel> projects;

  const _ProjectsListDesktop({required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < projects.length; i++)
          RevealProjectCard(
            project: projects[i],
            isReversed: i.isEven,
          ),
      ],
    );
  }
}

class _ProjectsListMobile extends StatelessWidget {
  final List<ProjectModel> projects;

  const _ProjectsListMobile({required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var project in projects)
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ProjectCardMobile(project: project),
          ),
      ],
    );
  }
}
