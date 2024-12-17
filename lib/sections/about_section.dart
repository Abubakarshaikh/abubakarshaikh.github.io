// lib/sections/about_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1180),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Left alignment
              children: [
                SectionTitle(title: 'About Me'),
                SizedBox(height: 45),
                EnhancedAboutContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EnhancedAboutContent extends StatelessWidget {
  const EnhancedAboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction Section
        SizedBox(
          width: 800, // Controlled width for better readability
          child: Text(
            "Hi, I'm Abubakar Shaikh! A passionate Flutter developer based in Karachi, Pakistan, with over 5 years of experience crafting beautiful and functional mobile applications.",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
          ),
        ),
        const SizedBox(height: 40),

        // Expertise Grid
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: [
            _buildExpertiseCard(
              context,
              "Mobile Development",
              "Specialized in Flutter development with a focus on creating performant, beautiful apps that users love.",
              Icons.smartphone,
            ),
            _buildExpertiseCard(
              context,
              "State Management",
              "Expert in Provider, BloC, Riverpod, and GetX for building scalable applications.",
              Icons.architecture,
            ),
            _buildExpertiseCard(
              context,
              "API Integration",
              "Proficient in Firebase, RESTful, GraphQL, and WebRTC implementations.",
              Icons.integration_instructions,
            ),
          ],
        ),
        const SizedBox(height: 40),

        // Skills Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Technical Expertise",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSkillTag(context, "Flutter Development"),
                _buildSkillTag(context, "State Management"),
                _buildSkillTag(context, "RESTful APIs"),
                _buildSkillTag(context, "Firebase"),
                _buildSkillTag(context, "UI/UX Design"),
                _buildSkillTag(context, "Clean Architecture"),
                _buildSkillTag(context, "Performance Optimization"),
                _buildSkillTag(context, "Cross-Platform Development"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpertiseCard(
      BuildContext context, String title, String description, IconData icon) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTag(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.background,
//         border: Border(
//           bottom: BorderSide(color: Colors.grey.shade200),
//         ),
//       ),
//       padding: EdgeInsets.symmetric(vertical: 120),
//       child: Column(
//         children: [
//           Container(
//             constraints: BoxConstraints(maxWidth: 1180),
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             width: double.infinity,
//             child: Column(
//               children: [
//                 SectionTitle(
//                   title: 'About Me',
//                   alignment: Alignment.center,
//                 ),
//                 SizedBox(height: 45),
//                 AboutCard(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class AboutCard extends StatefulWidget {
//   @override
//   State<AboutCard> createState() => _AboutCardState();
// }

// class _AboutCardState extends State<AboutCard> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: Container(
//         constraints: BoxConstraints(maxWidth: 740),
//         padding: EdgeInsets.all(45),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(isHovered ? 0.1 : 0.07),
//               blurRadius: isHovered ? 20 : 10,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             ProfileImage(),
//             SizedBox(height: 20),
//             AboutContent(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProfileImage extends StatefulWidget {
//   @override
//   State<ProfileImage> createState() => _ProfileImageState();
// }

// class _ProfileImageState extends State<ProfileImage> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 200),
//         transform: Matrix4.identity()..scale(isHovered ? 1.02 : 1.0),
//         child: Container(
//           height: 300,
//           width: 300,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: AssetImage('assets/images/about-img.webp'),
//               fit: BoxFit.cover,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 20,
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AboutContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BioParagraph(
//           text: "Hi, I'm Abubakar Shaikh!\n\nI'm a passionate Flutter developer based in Karachi, Pakistan, with over 5 years of experience crafting beautiful and functional mobile applications.",
//         ),
//         SizedBox(height: 30),
//         BioParagraph(
//           text: "I leverage my expertise in state management solutions (Provider, BloC, Riverpod, GetX) to build fast, responsive, and feature-rich apps that users love.",
//         ),
//         SizedBox(height: 30),
//         BioParagraph(
//           text: "Highly proficient in API integration (Firebase, RESTful, GraphQL, WebRTC), I ensure seamless data flow within your app. My background in design fuels my pixel-perfect UI creations, delivering user-friendly interfaces that are a joy to navigate.",
//         ),
//       ],
//     );
//   }
// }

// class BioParagraph extends StatefulWidget {
//   final String text;

//   const BioParagraph({required this.text});

//   @override
//   State<BioParagraph> createState() => _BioParagraphState();
// }

// class _BioParagraphState extends State<BioParagraph> {
//   bool isVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() => isVisible = true);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       duration: Duration(milliseconds: 1000),
//       opacity: isVisible ? 1.0 : 0.0,
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 1000),
//         transform: Matrix4.translationValues(
//           0,
//           isVisible ? 0 : 20,
//           0,
//         ),
//         child: Text(
//           widget.text,
//           style: Theme.of(context).textTheme.bodyMedium,
//           textAlign: TextAlign.justify,
//         ),
//       ),
//     );
//   }
// }