import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final Uri url;
  final String label;
  final ImageProvider? img;
  final IconData? ico;
  final Widget? child;

  const LinkButton(
      {super.key,
      required this.url,
      required this.label,
      this.img,
      this.ico,
      this.child});

  @override
  Widget build(BuildContext context) => TextButton.icon(
      onPressed: () => launchUrl(url, mode: LaunchMode.externalApplication),
      label: Text(label),
      icon: img != null
          ? Image(height: 24, width: 24, fit: BoxFit.contain, image: img!)
          : ico != null
              ? Icon(ico)
              : child ?? const Icon(Icons.abc));
}
