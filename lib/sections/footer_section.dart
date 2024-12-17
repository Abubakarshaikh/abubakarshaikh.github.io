import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:portfolio_website/utils/scroll_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 50),
          color: Colors.black,
          child: Column(
            children: [
              SocialLinks(),
              SizedBox(height: 30),
              Copyright(),
            ],
          ),
        ),
        ScrollToTopButton(),
      ],
    );
  }
}

class ScrollToTopButton extends StatefulWidget {
  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 40,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () => ScrollHelper.scrollToTop(context),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 57,
            width: 57,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isHovered ? 0.55 : 0.25),
                  blurRadius: isHovered ? 50 : 30,
                  spreadRadius: 0,
                ),
              ],
            ),
           child: Center(
              child: SvgPicture.asset(
                'assets/images/arrow.svg',
                height: 42,
                width: 42,
              ),
            ),
          ),
        ),
      ),
    );
  }
}







class SocialLinks extends StatelessWidget {
  final List<SocialLinkData> socialLinks = [
    SocialLinkData(
      icon: 'assets/images/social_icons/logo-twitter.svg',
      url: 'https://twitter.com/abubakrshykh',
    ),
    SocialLinkData(
      icon: 'assets/images/social icons/logo-github.svg',
      url: 'https://github.com/Abubakarshaikh',
    ),
    SocialLinkData(
      icon: 'assets/images/social_icons/logo-linkedin.svg',
      url: 'https://www.linkedin.com/in/shaikhabubakar/',
    ),
    SocialLinkData(
      icon: 'assets/images/social_icons/logo-youtube.svg',
      url: 'https://www.youtube.com/@AbubakarShaikh',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialLinks.map((link) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SocialIcon(data: link),
        );
      }).toList(),
    );
  }
}

class SocialIcon extends StatefulWidget {
  final SocialLinkData data;

  const SocialIcon({required this.data});

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHovered = false;

  void _launchURL() async {
    if (await canLaunchUrl(Uri.parse(widget.data.url))) {
      await launchUrl(Uri.parse(widget.data.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? 1.2 : 1.0),
          child: SvgPicture.asset(
            widget.data.icon,
            height: 35,
            width: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2023. Crafted within Karachi by Abubakar',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
      ),
    );
  }
}

class SocialLinkData {
  final String icon;
  final String url;

  const SocialLinkData({
    required this.icon,
    required this.url,
  });
}

