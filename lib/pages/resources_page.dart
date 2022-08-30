import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Resources')),
      body: FutureBuilder(
          future: Dio().get('https://api.github.com/repos/'
              'RA1NO3O/RA1NO3O/contents/website_resources.md?ref=master'),
          builder: (bc, AsyncSnapshot<Response> snapshot) => Markdown(
              onTapLink: (String text, String? href, String title) =>
                  href != null ? launchUrlString(href) : null,
              data: snapshot.data?.data['content'] != null
                  ? utf8.decode(base64Decode(
                      snapshot.data?.data['content'].replaceAll('\n', '')))
                  : '')));
}
