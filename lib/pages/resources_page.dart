import 'package:flutter/material.dart';
import 'package:ra1no3o_website/widgets/markdown_builder.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Resources')),
      body: const GithubMarkdownBuilder.alter(
          url: 'contents/website_resources.md?ref=master'));
}
