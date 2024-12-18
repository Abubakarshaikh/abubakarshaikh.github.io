import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/spacing.dart';
import 'package:portfolio_website/core/responsive/responsive_wrapper.dart';
import 'package:portfolio_website/features/navigation/presentation/widgets/nav_bar.dart';
import 'package:portfolio_website/shared/widgets/buttons/app_button.dart';
import 'package:portfolio_website/shared/widgets/chips/skill_chip.dart';
import 'package:portfolio_website/shared/widgets/containers/section_container.dart';
import 'package:portfolio_website/shared/widgets/text/animated_text.dart';

class HeaderSection extends StatelessWidget {
  final Function(String) onNavigate;

  const HeaderSection({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        image: DecorationImage(
          image: const AssetImage('assets/images/header_image.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Particles effect layer
          Positioned.fill(
            child: CustomPaint(
              painter: ParticlesPainter(),
            ),
          ),
          Column(
            children: [
              NavBar(onNavigate: onNavigate),
              Expanded(
                child: HeaderContent(onNavigate: onNavigate),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final Function(String) onNavigate;

  const HeaderContent({
    required this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: Colors.transparent,
      child: ResponsiveWrapper(
        mobile: _HeaderContentMobile(onNavigate: onNavigate),
        desktop: _HeaderContentDesktop(onNavigate: onNavigate),
      ),
    );
  }
}

class _HeaderContentDesktop extends StatelessWidget {
  final Function(String) onNavigate;

  const _HeaderContentDesktop({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWelcomeBadge(context),
        const SizedBox(height: Spacing.p24),
        AnimatedGradientText(
          text: "Hi, I'm Abubakar Shaikh",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: Spacing.p16),
        _buildAnimatedRoles(context),
        const SizedBox(height: Spacing.p24),
        _buildDescription(context),
        const SizedBox(height: Spacing.p40),
        _buildButtons(context),
        const SizedBox(height: Spacing.p60),
        _buildTechStack(context),
      ],
    );
  }

  Widget _buildAnimatedRoles(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText('Flutter Developer'),
            TypewriterAnimatedText('Mobile App Expert'),
            TypewriterAnimatedText('UI/UX Enthusiast'),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: 'View My Work',
          onPressed: () => onNavigate('projects'),
          icon: Icons.work_outline_rounded,
          showArrow: true,
        ),
        const SizedBox(height: Spacing.p16),
        AppButton(
          text: "Let's Connect",
          onPressed: () => onNavigate('contact'),
          type: ButtonType.secondary,
          icon: Icons.chat_bubble_outline_rounded,
        ),
      ],
    );
  }

  Widget _buildWelcomeBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.p16,
        vertical: Spacing.p8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.waving_hand_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: Spacing.p8),
          Text(
            "Welcome to my portfolio",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Text(
        "Transforming ideas into exceptional mobile experiences with Flutter. Specialized in crafting high-performance, scalable applications that users love.",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        AppButton(
          text: 'View My Work',
          onPressed: () => onNavigate('projects'),
          icon: Icons.work_outline_rounded,
          showArrow: true,
        ),
        const SizedBox(width: Spacing.p20),
        AppButton(
          text: "Let's Connect",
          onPressed: () => onNavigate('contact'),
          type: ButtonType.secondary,
          icon: Icons.chat_bubble_outline_rounded,
        ),
      ],
    );
  }

  Widget _buildTechStack(BuildContext context) {
    return const Wrap(
      spacing: Spacing.p20,
      runSpacing: Spacing.p20,
      children: [
        SkillChip(label: 'Flutter', icon: Icons.flutter_dash),
        SkillChip(label: 'Firebase', icon: Icons.local_fire_department),
        SkillChip(label: 'REST APIs', icon: Icons.api),
        SkillChip(label: 'Clean Code', icon: Icons.code),
      ],
    );
  }
}

class _HeaderContentMobile extends StatelessWidget {
  final Function(String) onNavigate;

  const _HeaderContentMobile({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWelcomeBadge(context),
        const SizedBox(height: Spacing.p24),
        AnimatedGradientText(
          text: "Hi, I'm Abubakar",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: Spacing.p16),
        _buildAnimatedRoles(context),
        const SizedBox(height: Spacing.p24),
        _buildDescription(context),
        const SizedBox(height: Spacing.p32),
        _buildMobileButtons(context),
        const SizedBox(height: Spacing.p40),
        _buildTechStack(context),
      ],
    );
  }

  // Reuse the same helper methods from desktop with mobile-specific adjustments
  // ... (Similar methods as _HeaderContentDesktop with mobile-specific styles)

  Widget _buildTechStack(BuildContext context) {
    return const Wrap(
      spacing: Spacing.p20,
      runSpacing: Spacing.p20,
      children: [
        SkillChip(label: 'Flutter', icon: Icons.flutter_dash),
        SkillChip(label: 'Firebase', icon: Icons.local_fire_department),
        SkillChip(label: 'REST APIs', icon: Icons.api),
        SkillChip(label: 'Clean Code', icon: Icons.code),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Text(
        "Transforming ideas into exceptional mobile experiences with Flutter. Specialized in crafting high-performance, scalable applications that users love.",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }

  Widget _buildWelcomeBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.p16,
        vertical: Spacing.p8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.waving_hand_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: Spacing.p8),
          Text(
            "Welcome to my portfolio",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedRoles(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText('Flutter Developer'),
            TypewriterAnimatedText('Mobile App Expert'),
            TypewriterAnimatedText('UI/UX Enthusiast'),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: 'View My Work',
          onPressed: () => onNavigate('projects'),
          icon: Icons.work_outline_rounded,
          showArrow: true,
        ),
        const SizedBox(height: Spacing.p16),
        AppButton(
          text: "Let's Connect",
          onPressed: () => onNavigate('contact'),
          type: ButtonType.secondary,
          icon: Icons.chat_bubble_outline_rounded,
        ),
      ],
    );
  }
}

class ParticlesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Add some random dots for particle effect
    for (var i = 0; i < 50; i++) {
      final x = (size.width * i / 50) % size.width;
      final y = (size.height * (i * i) / 2500) % size.height;
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
