import 'package:flutter/material.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:provider/provider.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    final routerProvider = Provider.of<RouterProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Pallete.softgrey.withOpacity(0.3))),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Group", style: TextStyle(color: Pallete.textColor, fontWeight: FontWeight.bold, fontSize: 24)),
          GestureDetector(
            onTap: () => routerProvider.changeRoute(newRoute: '/FriendList', canPop: false, showBBar: false),
            child: CPointer(child: Image.asset('assets/images/icons/addSingleUser.png', height: 27,color: HexColor('#6f8190'),)),
          ),
        ],
      ),
    );
  }
}
