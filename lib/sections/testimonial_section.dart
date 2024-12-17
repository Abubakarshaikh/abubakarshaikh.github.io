// lib/sections/testimonial_section.dart
import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/section_title.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 120),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 1180),
            padding: EdgeInsets.symmetric(horizontal: 20),
             width: double.infinity,
            child: Column(
              children: [
                SectionTitle(
                  title: 'Testimonials',
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                TestimonialList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1240;

    if (isDesktop) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...testimonials.map((testimonial) => Padding(
              padding: EdgeInsets.only(right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TestimonialCard(testimonial: testimonial),
              ),
            )),
          ],
        ),
      );
    }

    return Column(
      children: [
        ...testimonials.map((testimonial) => Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: TestimonialCard(testimonial: testimonial),
        )),
      ],
    );
  }
}

class TestimonialCard extends StatefulWidget {
  final TestimonialData testimonial;

  const TestimonialCard({required this.testimonial});

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.1 : 0.07),
              blurRadius: isHovered ? 20 : 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.testimonial.imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              widget.testimonial.name,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              widget.testimonial.role,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              widget.testimonial.testimonial,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialData {
  final String name;
  final String role;
  final String location;
  final String testimonial;
  final String imageUrl;

  const TestimonialData({
    required this.name,
    required this.role,
    required this.location,
    required this.testimonial,
    required this.imageUrl,
  });
}

final List<TestimonialData> testimonials = [
  TestimonialData(
    name: 'Gateri',
    role: 'Client',
    location: 'Kenya',
    testimonial: '"Highly Recommend Abubakar - Exceptional Flutter Developer I had the pleasure of working with Abubakar on a Flutter project and was thoroughly impressed by his expertise. His meticulous attention to detail ensured a world-class final product. Communication & Follow-Through: Abubakar excelled in communication, keeping me informed throughout the process and readily available for any questions. His follow-up was impeccable, guaranteeing timely delivery.."',
    imageUrl: 'assets/images/fiverr.png',
  ),
  TestimonialData(
    name: 'Nicholas Shook',
    role: 'Flutter Developer',
    location: 'Malaysia',
    testimonial: '"delivered good work on the app development project and I enjoyed working with him. His communication was top-notch, and his skills were reasonably strong. I enjoyed working with Abubakar and will likely have additional jobs for him in the future."',
    imageUrl: 'assets/images/upwork.webp',
  ),
  // Add other testimonials...
];