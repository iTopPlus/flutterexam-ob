import 'package:flutter/material.dart';
import 'package:project_it/Components/Button.dart';
import 'package:project_it/Pages/Group/GroupCreatePage.dart';
import 'package:project_it/Providers/FriendProvider.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/PushNavBar.dart';
import 'package:project_it/Widgets/SearchField.dart';
import 'package:provider/provider.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  String searchUsername = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routerProvider = Provider.of<RouterProvider>(context, listen: false);
    final friendProvider = Provider.of<FriendProvider>(context, listen: false);
    final friends = friendProvider.friendList;

    final filteredFriends = friends.where((friend) {
      return friend['name'].toLowerCase().contains(searchUsername.toLowerCase());
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          const PushNavbar(label: 'Friend lists'),
          Expanded(
            child: Container(
              color: Pallete.white,
              child: (friends.isNotEmpty)
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          SearchField(
                            onTextChanged: (text) => setState(() => searchUsername = text),
                            onFocusLost: (text) => setState(() => searchUsername = text),
                          ),
                          Row(
                            children: [
                              Text(
                                "Friend ${filteredFriends.isNotEmpty ? filteredFriends.length : ""}",
                                style: TextStyle(color: Pallete.softGreen, fontSize: 16),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: ListView.builder(
                                itemCount: filteredFriends.length,
                                itemBuilder: (context, index) {
                                  final friend = filteredFriends[index];
                                  return ProfileRow(
                                    imageUrl: friend['imageUrl'],
                                    name: friend['name'],
                                    showChecker: false,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/images/icons/userGreen.png', width: 200, height: 200),
                            const Text("You do not have any friends yet.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text("Start adding friends so you can add them ", style: TextStyle(fontSize: 14)),
                            AppButton(
                              bgColor: Pallete.black,
                              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              label: "Add Friend",
                              obTap: () => routerProvider.changeRoute(
                                newRoute: '/AddFriend',
                                canPop: true,
                                showBBar: false,
                                backTo: '/FriendList',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: friends.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () {
                routerProvider.changeRoute(newRoute: '/AddFriend', canPop: true, showBBar: false, backTo: '/FriendList');
              },
              backgroundColor: HexColor("#474a51"),
              shape: const CircleBorder(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset('assets/images/icons/addSingleUser.png'),
                ),
              ),
            ),
    );
  }
}
