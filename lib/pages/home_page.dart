import 'package:flutter/material.dart';
import 'package:ra1no3o_website/common/dialect.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  Widget build(BuildContext context) => Title(
        title: 'RA1NO3O - 首页',
        color: Colors.blue,
        child: Scaffold(
          drawer: Drawer(
              child: ListView(
            children: const [DrawerHeader(child: Text('导航'))],
          )),
          appBar: AppBar(title: const Text('RA1NO3O.dev'), centerTitle: false),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Recent Photos'),
              Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    image: Assets.image('IMG_0252.png'),
                    width: 350,
                    height: 400,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 5),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  linkButton(
                      url: 'https://github.com/RA1NO3O',
                      label: 'Github',
                      img: Assets.icon(isDarkMode(context)
                          ? 'GitHub-Mark-Light-64px.png'
                          : 'GitHub-Mark-64px.png')),
                  linkButton(
                      url: 'https://twitter.com/RA1NO3O',
                      label: 'Twitter',
                      img: Assets.icon('twitter-circle-blue.png')),
                  linkButton(
                      url: 'https://steamcommunity.com/id/RA1NO3O',
                      label: 'Steam',
                      ico: Icons.games),
                  linkButton(
                      url: 'https://discord.gg/k9agNQtT',
                      label: 'Discord Server',
                      img: Assets.icon('Discord-Logo-Color.png')),
                ],
              ),
              const Divider(height: 20),
            ],
          ),
        ),
      );

  TextButton linkButton(
          {required String url,
          required String label,
          ImageProvider? img,
          IconData? ico}) =>
      TextButton.icon(
        onPressed: () => launchUrlString(url),
        label: Text(label),
        icon: img != null
            ? Image(height: 24, width: 24, fit: BoxFit.contain, image: img)
            : ico != null
                ? Icon(ico)
                : const Icon(Icons.abc),
      );
}
