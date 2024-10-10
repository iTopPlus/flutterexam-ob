import 'package:flutter/material.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/Appbar.dart';
import 'package:provider/provider.dart';

class NoGroupWidget extends StatelessWidget {
  const NoGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppNavBar(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/icons/talk.png', height: 200, fit: BoxFit.cover),
                const Text("You do not hvave any groups yet.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), overflow: TextOverflow.ellipsis, maxLines: 1),
                const SizedBox(height: 10),
                const Text("Create a new group to easily manage and", style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 1),
                const Text("collect payments from members.", style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 1),
                GestureDetector(
                  onTap: () {
                    var currentRoute = Provider.of<RouterProvider>(context, listen: false);
                    // Navigator.pop(context);
                    currentRoute.changeRoute(newRoute: '/GroupCreate', canPop: true, showBBar: false);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                      height: 46,
                      decoration: BoxDecoration(color: Pallete.black, borderRadius: BorderRadius.circular(8)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image.asset('assets/images/icons/addUser.png', height: 35),
                        const SizedBox(width: 5),
                        Text("Start new group", style: TextStyle(color: Pallete.white, fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
