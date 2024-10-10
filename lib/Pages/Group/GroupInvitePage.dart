import 'package:flutter/material.dart';
import 'package:project_it/Components/Button.dart';
import 'package:project_it/Pages/Group/GroupCreatePage.dart';
import 'package:project_it/Providers/FriendProvider.dart';
import 'package:project_it/Providers/InviteProvider.dart';
import 'package:project_it/Providers/RouterProvider.dart';

import 'package:project_it/Services/AppPallete.dart';

import 'package:project_it/Widgets/PushNavBar.dart';
import 'package:project_it/Widgets/SearchField.dart';
import 'package:provider/provider.dart';

class GroupInvitePage extends StatefulWidget {
  const GroupInvitePage({super.key});

  @override
  State<GroupInvitePage> createState() => GroupInvitePageState();
}

class GroupInvitePageState extends State<GroupInvitePage> {
  @override
  Widget build(BuildContext context) {
    final friendProvider = Provider.of<FriendProvider>(context, listen: false);
    final inviteProvider = Provider.of<InviteProvider>(context, listen: false);
    final routerProvider = Provider.of<RouterProvider>(context, listen: false);
    final Friends = friendProvider.friendList;
    return Scaffold(
      backgroundColor: Pallete.white,
      body: Column(
        children: [
          const PushNavbar(label: "Invite Friends to group"),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
            child: const SearchField(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
            child: Row(
              children: [
                Text("Friends", style: TextStyle(color: Pallete.softGreen, fontSize: 18)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: Friends.length,
                    itemBuilder: (context, index) {
                      final user = Friends[index];
                      final name = user['name'];
                      final imageUrl = user['imageUrl'];
                      final isChecked = user['checked'] ?? false;
                  
                      return ProfileRow(
                        imageUrl: imageUrl,
                        name: name,
                        checked: isChecked,
                        onChecked: (value) {
                          setState(() {
                            inviteProvider.invite(name, imageUrl, !isChecked);
                            user['checked'] = !isChecked;
                          });
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                          label: "Invite",
                          obTap: () {
                            routerProvider.changeRoute(newRoute: '/GroupCreate', showBBar: false, canPop: true);
                          },
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
