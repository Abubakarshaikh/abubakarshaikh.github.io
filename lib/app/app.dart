import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/core/theme/theme_provider.dart';
import 'package:portfolio_website/features/home/presentation/pages/home_page.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return MaterialApp(
      title: 'Abubakar Shaikh - Flutter Developer',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: const HomePage(),
    );
  }
}