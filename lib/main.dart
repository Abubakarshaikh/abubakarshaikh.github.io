// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/sections/footer_section.dart';
import 'package:portfolio_website/widgets/scroll_to_top_fab.dart';

import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/header_section.dart';
import 'sections/work_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abubakar Shaikh - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(context),
      home: const PortfolioHome(),
    );
  }

  ThemeData _buildTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF193335),
        secondary: Color(0xFF394344),
        surface: Colors.white,
        onSurface: Color(0xFF333333),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.jost(
          fontSize: 85,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.jost(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF333333),
        ),
        displaySmall: GoogleFonts.jost(
          fontSize: 35,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF333333),
        ),
        bodyLarge: GoogleFonts.jost(
          fontSize: 23,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF333333),
        ),
        bodyMedium: GoogleFonts.jost(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF333333),
        ),
      ),
      shadowColor: Colors.black.withOpacity(0.07),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> sectionKeys = {
    'header': GlobalKey(),
    'work': GlobalKey(),
    'about': GlobalKey(),
    'contact': GlobalKey(),
  };
  bool showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 100 && !showScrollToTop) {
      setState(() => showScrollToTop = true);
    } else if (_scrollController.offset <= 100 && showScrollToTop) {
      setState(() => showScrollToTop = false);
    }
  }

  void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: HeaderSection(
                  key: sectionKeys['header'],
                  onNavigate: scrollToSection,
                ),
              ),
              SliverToBoxAdapter(
                child: WorkSection(key: sectionKeys['work']),
              ),
              // const SliverToBoxAdapter(child: TestimonialSection()),
              SliverToBoxAdapter(
                child: AboutSection(key: sectionKeys['about']),
              ),
              SliverToBoxAdapter(
                child: ContactSection(key: sectionKeys['contact']),
              ),
              SliverToBoxAdapter(child: Footer()),
            ],
          ),
          if (showScrollToTop)
            Positioned(
              bottom: 32,
              right: 40,
              child: ScrollToTopFAB(
                onPressed: () => scrollToSection('header'),
              ),
            ),
        ],
      ),
    );
  }
}
