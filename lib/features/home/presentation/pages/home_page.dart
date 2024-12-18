import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/features/about/presentation/sections/about_section.dart';
import 'package:portfolio_website/features/contact/presentation/sections/contact_section.dart';
import 'package:portfolio_website/features/footer/presentation/sections/footer_section.dart';
import 'package:portfolio_website/features/header/presentation/sections/header_section.dart';
import 'package:portfolio_website/features/projects/presentation/sections/projects_section.dart';
import 'package:portfolio_website/shared/providers/scroll_provider.dart';
import 'package:portfolio_website/shared/widgets/buttons/scroll_to_top.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Map<String, GlobalKey> sectionKeys = {
    'header': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);
    final showScrollToTop = ref.watch(scrollPositionProvider) > 100;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                key: sectionKeys['header'],
                child: HeaderSection(
                  onNavigate: (section) => ref
                      .read(scrollPositionProvider.notifier)
                      .scrollToSection(sectionKeys[section]!),
                ),
              ),
              SliverToBoxAdapter(
                key: sectionKeys['projects'],
                child: const ProjectsSection(),
              ),
              SliverToBoxAdapter(
                key: sectionKeys['about'],
                child: const AboutSection(),
              ),
              SliverToBoxAdapter(
                key: sectionKeys['contact'],
                child: const ContactSection(),
              ),
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),
          if (showScrollToTop)
            ScrollToTopButton(
              onPressed: () =>
                  ref.read(scrollPositionProvider.notifier).scrollToTop(),
            ),
        ],
      ),
    );
  }
}
