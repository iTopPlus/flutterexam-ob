import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/Appbar.dart';

class GroupSettingPage extends StatefulWidget {
  const GroupSettingPage({super.key});

  @override
  State<GroupSettingPage> createState() => _GroupSettingPageState();
}

class _GroupSettingPageState extends State<GroupSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Pallete.white,
      child: const Column(
        children: [
          AppNavBar(),
          Text("GroupSettingPage"),
        ],
      ),
    );
  }
}
