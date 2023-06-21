import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pallete.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
final Uri url1 = Uri.parse('https://mailto:gopal.singh.rajput.3256@gmail.com');
bool showSidebar = true;

class Navbar extends StatelessWidget {
  const Navbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromRGBO(40, 44, 52, 1),
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Gopal Singh S'),
                accountEmail: const Text('gopal.singh.rajput.3256@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://media.licdn.com/dms/image/C4D03AQEn_FoGlKe_og/profile-displayphoto-shrink_400_400/0/1657480606657?e=1691625600&v=beta&t=WxVdHQpliSEtW8zceXBnrslAt0P6NdG81J91TxT_YMA',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://e0.pxfuel.com/wallpapers/175/813/desktop-wallpaper-spider-man-into-the-spider-verse-s-leap-of-faith-scene-a-breakdown-polygon-miles-morales-falling.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.envelope),
                title: const Text('Mail me'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://mailto:gopal.singh.rajput.3256@gmail.com/');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.linkedin),
                title: const Text('LinkedIn'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://www.linkedin.com/in/gopal-singh-s-49b62a166/');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.github),
                title: const Text('Github'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url =
                      Uri.parse('https://github.com/GopalSinghRajput');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.stackOverflow),
                title: const Text('Stack Overflow'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://stackoverflow.com/users/21873005/gopal-singh-rajput');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.hackerrank),
                title: const Text('Hacker-rank'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://www.hackerrank.com/gopal_singh_raj1?hr_r=1');
                  launchUrl(url);
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(FontAwesomeIcons.instagram),
                title: const Text('Instagram'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://www.instagram.com/gopal_singh_rajput_1014/');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.twitter),
                title: const Text('Twitter'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url =
                      Uri.parse('https://twitter.com/GopalSi92886426');
                  launchUrl(url);
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.discord),
                title: const Text('Discord'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  final Uri url = Uri.parse(
                      'https://discord.com/channels/@Vitriol%20Victus#8826');
                  launchUrl(url);
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
                textColor: Pallete.whiteColor,
                iconColor: Pallete.whiteColor,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
        )
        ;
  }
}
