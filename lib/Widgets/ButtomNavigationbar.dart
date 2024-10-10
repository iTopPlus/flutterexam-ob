import 'package:flutter/material.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:provider/provider.dart';

class BottomNavigationbar extends StatefulWidget {
  final String currentRoute;
  const BottomNavigationbar({
    super.key,
    this.currentRoute = '/noneGroup',
  });

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  final List<Map<String, dynamic>> _buttons = [
    {
      'label': 'Groups',
      'icon': Icons.group,
      'type': 'icon',
      'route': '/',
    },
    {
      'label': 'Notifications',
      'icon': Icons.notifications,
      'type': 'stack',
      'route': '/GroupNotifications',
    },
    {
      'label': 'Profile',
      'icon': 'assets/images/icons/profile.png',
      'type': 'image',
      'route': '/GroupProfile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Pallete.softgrey.withOpacity(0.5), offset: const Offset(0, 0), blurRadius: 5, spreadRadius: 0),
        ],
        color: Pallete.white,
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_buttons.length, (index) {
          final button = _buttons[index];
          return _buildButton(button, index);
        }),
      ),
    );
  }

  Widget _buildButton(Map<String, dynamic> button, int index) {
    Widget iconWidget;
    if (button['type'] == 'icon') {
      iconWidget = Icon(
        button['icon'],
        color: widget.currentRoute == button['route'] ? Pallete.softGreen : HexColor("#6f8190"),
      );
    } else if (button['type'] == 'stack') {
      iconWidget = Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Icon(
              button['icon'],
              color: widget.currentRoute == button['route'] ? Pallete.softGreen : HexColor("#6f8190"),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(10))),
              child: const Center(child: Text('99+', style: TextStyle(color: Colors.white, fontSize: 12))),
            ),
          ),
        ],
      );
    } else {
      iconWidget = Image.asset(
        button['icon'],
        fit: BoxFit.cover,
        width: 37,
        height: 37,
      );
    }

    return InkWell(
      onTap: () {
        final routerProvider = Provider.of<RouterProvider>(context, listen: false);

        routerProvider.changeRoute(newRoute: button['route'], canPop: false, showBBar: true);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            Text(
              button['label'],
              style: TextStyle(
                fontSize: 16,
                color: widget.currentRoute == button['route'] ? Pallete.softGreen : HexColor("#6f8190"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
