import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';
import 'package:provider/provider.dart';
import 'package:ra1no3o_website/common/urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

void markdownLinkOnTap(String text, String? href, String title) => href != null
    ? launchUrlString(href, mode: LaunchMode.externalApplication)
    : null;

final markdownStyleSheet = MarkdownStyleSheet(
  code:
      const TextStyle(color: Colors.white, backgroundColor: Color(0xFF161B22)),
  codeblockDecoration: BoxDecoration(
      color: const Color(0xFF161B22),
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey)),
);

class GithubMarkdownBuilder extends StatefulWidget {
  final String url;
  final bool keepAlive;

  const GithubMarkdownBuilder(
      {super.key, required this.url, this.keepAlive = true});

  /// Use this constructor to use [MarkdownBody] instead of [Markdown]
  const factory GithubMarkdownBuilder.alter({Key? key, required String url}) =
      _GithubMarkdown;

  @override
  State<GithubMarkdownBuilder> createState() => _GithubMarkdownBuilderState();

  Widget markdownWidget({required Map<String, dynamic> data}) {
    return MarkdownBody(
        selectable: true,
        onTapLink: markdownLinkOnTap,
        styleSheet: markdownStyleSheet,
        data: data['content'] != null
            ? utf8.decode(base64Decode(data['content'].replaceAll('\n', '')))
            : '');
  }
}

class _GithubMarkdownBuilderState extends State<GithubMarkdownBuilder>
    with AutomaticKeepAliveClientMixin {
  final vm = GithubMarkdownVM();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    vm.fetch(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<GithubMarkdownVM>.value(
        value: vm,
        child: Consumer<GithubMarkdownVM>(
            builder: (bc, vm, _) => widget.markdownWidget(data: vm.data)));
  }
}

class _GithubMarkdown extends GithubMarkdownBuilder {
  const _GithubMarkdown({super.key, required super.url});

  @override
  Widget markdownWidget({required Map<String, dynamic> data}) => Markdown(
      selectable: true,
      styleSheet: markdownStyleSheet,
      extensionSet: ExtensionSet.gitHubWeb,
      onTapLink: markdownLinkOnTap,
      data: data.isEmpty
          ? ''
          : utf8.decode(base64Decode(data['content'].replaceAll('\n', ''))));
}

class GithubMarkdownVM extends ChangeNotifier {
  var data = <String, dynamic>{};

  Future<void> fetch(String url) async {
    final response = await http.get(Uri.parse('$repoUrl/$url'));
    if (response.body.isNotEmpty) {
      data = jsonDecode(response.body) as Map<String, dynamic>;
      notifyListeners();
    }
  }
}
