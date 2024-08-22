import 'package:flutter/material.dart';
import 'package:ra1no3o_website/common/dialect.dart';
import 'package:ra1no3o_website/common/styles.dart';
import 'package:ra1no3o_website/common/version.dart';
import 'package:ra1no3o_website/pages/resources_page.dart';
import 'package:ra1no3o_website/widgets/link_button.dart';
import 'package:ra1no3o_website/widgets/markdown_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) => Title(
      title: 'RA1NO3O - Home',
      color: colorSeed,
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(title: const Text('RA1NO3O.dev')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const GithubMarkdownBuilder(url: 'contents/website.md?ref=master'),
            const Divider(height: 20),
            const Text('Recent Photos'),
            Card(
                clipBehavior: Clip.antiAlias,
                child: Image(
                    image: Assets.image('IMG_1044.jpeg'),
                    width: 350,
                    height: 400,
                    fit: BoxFit.cover)),
            const SizedBox(height: 5),
            Wrap(
              direction: Axis.horizontal,
              children: [
                LinkButton(
                    url: Uri.https('github.com', '/RA1NO3O'),
                    label: 'Github',
                    child: Assets.icon(isDarkMode(context)
                        ? 'GitHub-Mark-Light-64px.png'
                        : 'GitHub-Mark-64px.png')),
                LinkButton(
                    url: Uri.https('x.com', '/RA1NO3O'),
                    label: 'Twitter(X)',
                    child: Assets.icon(
                        'twitter_x${isDarkMode(context) ? '_white' : ''}.svg')),
                LinkButton(
                    url: Uri.https('steamcommunity.com', '/id/RA1NO3O'),
                    label: 'Steam',
                    child: Assets.icon('steam_icon_logo.svg')),
                LinkButton(
                  url: Uri.https('profile.playstation.com','/RA1NO3O'),
                  label: 'Playstation',
                  child: Assets.icon('playstation_${isDarkMode(context) ? 'white' : 'black'}.svg')
                ),
                LinkButton(
                    url: Uri.https('discord.gg', '/KZQkrXz'),
                    label: 'Discord Server',
                    child: Assets.icon('Discord-Logo-Color.png')),
                LinkButton(
                    url: Uri.https('music.apple.com', '/profile/RA1NO3O'),
                    label: 'Apple Music(JP)',
                    ico: Icons.library_music_rounded),
              ],
            ),
            const Divider(height: 20),
            const GithubMarkdownBuilder(url: 'contents/devices.md?ref=master'),
            const Divider(height: 20),
            const GithubMarkdownBuilder(url: 'contents/game_id.md?ref=master'),
            const Divider(height: 20),
          ],
        ),
      ));
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Icon(Icons.engineering, size: 64, color: Colors.grey)),
            ListTile(
                leading: const Icon(Icons.interests),
                title: const Text('Resources'),
                onTap: () =>
                    Navigator.push(context, mpr(const ResourcesPage()))),
            AboutListTile(
                icon: const Icon(Icons.info),
                applicationName: 'ra1no3o.dev',
                applicationIcon: const Padding(
                    padding: EdgeInsets.all(8.0), child: Icon(Icons.web)),
                applicationLegalese:
                    'https://github.com/RA1NO3O/ra1no3o_website',
                applicationVersion: VersionUtil.packageInfo.version),
          ],
        ),
      );
}