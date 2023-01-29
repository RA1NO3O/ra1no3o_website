import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ra1no3o_website/common/network.dart';
import 'package:ra1no3o_website/common/urls.dart';

class GithubMarkdownBuilder extends StatelessWidget {
  final String url;

  const GithubMarkdownBuilder({super.key, required this.url});

  const factory GithubMarkdownBuilder.alter({Key? key, required String url}) =
      _GithubMarkdown;

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: NetworkUtil.dio.get('$repoUrl/$url'),
      builder: (bc, AsyncSnapshot<Response> snapshot) => MarkdownBody(
          data: snapshot.data?.data['content'] != null
              ? utf8.decode(base64Decode(
                  snapshot.data?.data['content'].replaceAll('\n', '')))
              : ''));
}

class _GithubMarkdown extends GithubMarkdownBuilder {
  const _GithubMarkdown({Key? key, required String url})
      : super(key: key, url: url);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: NetworkUtil.dio.get('$repoUrl/$url'),
      builder: (bc, AsyncSnapshot<Response> snapshot) => Markdown(
          data: snapshot.data?.data['content'] != null
              ? utf8.decode(base64Decode(
                  snapshot.data?.data['content'].replaceAll('\n', '')))
              : ''));
}
