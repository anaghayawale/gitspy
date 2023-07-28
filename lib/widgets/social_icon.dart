import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon(
      {super.key, required this.imageUrl, required this.linkUrl});

  final String imageUrl;
  final String linkUrl;

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(linkUrl);
    return IconButton(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        launchUrl(url);
      },
      icon: SvgPicture.asset(imageUrl),
    );
  }
}
