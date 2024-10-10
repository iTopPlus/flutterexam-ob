import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> settings = [
    {
      'image': 'assets/images/icons/notification.png',
      'label': 'Notification Settings',
    },
    {
      'image': 'assets/images/icons/signout.png',
      'label': 'Sign Out',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Pallete.white,
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 1,
                color: Pallete.softgrey.withOpacity(.3),
              )),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    child: Image.asset(
                      'assets/images/icons/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Yodsakorn",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Icon(FontAwesomeIcons.edit, size: 20, color: Pallete.grey),
                        ],
                      ),
                      Text(
                        "Email@gmail.com",
                        style: TextStyle(fontSize: 16, color: HexColor('#6F8190')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...settings.map((setting) {
            return SettingRow(
              PrefixImage: setting['image']!,
              Label: setting['label']!,
              onTap: () {
                if (setting['label'] == "Sign Out") {
                  Navigator.pushReplacementNamed(context, '/FirstTime');
                }
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget SettingRow({required String PrefixImage, required String Label, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: Pallete.softgrey.withOpacity(.3),
          )),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(PrefixImage, height: 23, width: 23),
            ),
            Expanded(
              child: Text(
                Label,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            Image.asset('assets/images/icons/chevron_right.png', height: 20, width: 20),
          ],
        ),
      ),
    );
  }
}
