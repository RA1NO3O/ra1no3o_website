import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ra1no3o_website/common/dialect.dart';
import 'package:ra1no3o_website/pages/resources_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  Widget build(BuildContext context) => Title(
      title: 'RA1NO3O - 首页',
      color: Colors.blue,
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(title: const Text('RA1NO3O.dev')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FutureBuilder(
                future: Dio().get('https://api.github.com/repos/'
                    'RA1NO3O/RA1NO3O/contents/website.md?ref=master'),
                builder: (bc, AsyncSnapshot<Response> snapshot) => MarkdownBody(
                    data: snapshot.data?.data['content'] != null
                        ? utf8.decode(base64Decode(snapshot
                            .data?.data['content']
                            .replaceAll('\n', '')))
                        : '')),
            const Divider(height: 20),
            const Text('Recent Photos'),
            Card(
                clipBehavior: Clip.antiAlias,
                child: Image(
                    image: Assets.image('IMG_1122.jpeg'),
                    width: 350,
                    height: 400,
                    fit: BoxFit.cover)),
            const SizedBox(height: 5),
            Wrap(
              direction: Axis.horizontal,
              children: [
                LinkButton(
                    url: 'https://github.com/RA1NO3O',
                    label: 'Github',
                    img: Assets.icon(isDarkMode(context)
                        ? 'GitHub-Mark-Light-64px.png'
                        : 'GitHub-Mark-64px.png')),
                LinkButton(
                    url: 'https://twitter.com/RA1NO3O',
                    label: 'Twitter',
                    img: Assets.icon('twitter-circle-blue.png')),
                const LinkButton(
                    url: 'https://steamcommunity.com/id/RA1NO3O',
                    label: 'Steam',
                    ico: Icons.games),
                LinkButton(
                    url: 'https://discord.gg/k9agNQtT',
                    label: 'Discord Server',
                    img: Assets.icon('Discord-Logo-Color.png')),
              ],
            ),
            const Divider(height: 20),
            Row(
              children: [
                const SelectableText(
                    'MineCraft (Bedrock) Server: server.ra1no3o.dev'),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.open_in_new),
                  tooltip: '复制并打开',
                  onPressed: () => Clipboard.setData(
                          const ClipboardData(text: 'server.ra1no3o.dev'))
                      .then((_) {
                    showSnackBar(context, const SnackBar(content: Text('已复制')));
                    launchUrlString('minecraft://');
                  }),
                ),
              ],
            ),
            const Divider(height: 20),
            SelectableText.rich(TextSpan(children: [
              const TextSpan(text: 'プロセカ: 6479525479460877\n'),
              WidgetSpan(
                child: Row(
                  children: [
                    const Text('ガルパ : 98915698'),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.open_in_new),
                      tooltip: '复制并打开',
                      onPressed: () => Clipboard.setData(
                              const ClipboardData(text: '98915698'))
                          .then((_) {
                        showSnackBar(
                            context, const SnackBar(content: Text('已复制')));
                        launchUrlString('garupa://');
                      }),
                    ),
                  ],
                ),
              ),
              const TextSpan(
                  text: 'ブルアカ：ASATXRRT\n'
                      'プリコネR : 869652905\n'
                      '原神(米哈游国服)ID: 101248113')
            ])),
            const Divider(height: 20),
            const SelectableText('Desktop: HP OMEN 45L\n'
                'Mouse: Logitech GPro SuperLight Wireless\n'
                'CPU: Intel(R) Core(TM) i7-12700K @ 3.6GHz\n'
                'Graphics Card: NVIDIA GeForce RTX 3080Ti\n'
                'Monitor: ASUS VG28UQL1A 28\'\'(4K@144Hz HDR400)\n'
                'Keyboard: HyperX™ Alloy Origins Core (Aqua 97)\n'
                'Joystick: XBOX Elite2 Core Controller\n'
                'Headphones: Apple Airpods Pro 2\n'
                'Phone: Apple iPhone13 Pro\n'
                'Tablet: Apple iPad Pro 11-inch 2021 (SoC: M1)\n'
                'Laptop: Apple MacBook Pro 14\'\' (SoC: M1 Pro)\n'),
            const Divider(height: 20),
          ],
        ),
      ));
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
            child: Icon(Icons.engineering, size: 64, color: Colors.grey)),
        ListTile(
            title: const Text('Resources'),
            onTap: () => Navigator.push(context, mpr(const ResourcesPage()))),
      ],
    ));
  }
}

class LinkButton extends StatelessWidget {
  final String url;
  final String label;
  final ImageProvider? img;
  final IconData? ico;

  const LinkButton(
      {Key? key, required this.url, required this.label, this.img, this.ico})
      : assert(img != null || ico != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => TextButton.icon(
      onPressed: () => launchUrlString(url),
      label: Text(label),
      icon: img != null
          ? Image(height: 24, width: 24, fit: BoxFit.contain, image: img!)
          : ico != null
              ? Icon(ico)
              : const Icon(Icons.abc));
}
