import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:provider/provider.dart';

class PushNavbar extends StatelessWidget {
  final String label;
  final bool? doPop;
  const PushNavbar({super.key, required this.label, this.doPop});

  @override
  Widget build(BuildContext context) {
    var currentRoute = Provider.of<RouterProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Pallete.softgrey.withOpacity(0.3)),
        ),
        boxShadow: [
          BoxShadow(
            color: Pallete.softgrey,
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 56,
      width: double.infinity,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if(doPop != null && doPop == true)return Navigator.pop(context);
              final backTo = (currentRoute.currentRoute['backTo'] ?? '/');
              final showBBar = (backTo == "/" ? true : false);
              currentRoute.changeRoute(newRoute: backTo, canPop: false, showBBar: showBBar);
              if (currentRoute.currentRoute['canPop'] == true) {
                currentRoute.reset();
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              child: const Icon(FontAwesomeIcons.chevronLeft, size: 20),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: Pallete.textColor, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
