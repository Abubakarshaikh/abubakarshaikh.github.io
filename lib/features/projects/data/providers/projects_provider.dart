import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/shared/models/project_model.dart';

final projectsProvider = Provider<List<ProjectModel>>((ref) {
  return [
    const ProjectModel(
      title: 'Salesflo Core',
      category: 'Mobile App',
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
    const ProjectModel(
      title: 'Synapp Messaging',
      category: 'Mobile App',
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
    const ProjectModel(
      title: 'CandyHub: Sweet Marketplace',
      category: 'E-Commerce',
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
    const ProjectModel(
      title: 'Inversa',
      category: 'Loyalty Program',
      description: [
        "Inversa is a loyalty program app for stores like OXXO and Volaris. Earn points for purchases, redeem them for discounts or rewards, and discover exclusive deals.",
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
    const ProjectModel(
      title: 'Tether',
      category: 'Pet Care',
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
    const ProjectModel(
      title: 'Ninecoin: marketplace for the digital currency',
      category: 'Cryptocurrency',
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
    const ProjectModel(
      title: 'Vicofinanzas: finance management',
      category: 'Finance',
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
    const ProjectModel(
      title: 'Pimeraplanta: simplifies employee time-tracking and approval',
      category: 'Business Management',
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
});
