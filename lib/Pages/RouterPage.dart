import 'package:flutter/material.dart';
import 'package:project_it/Pages/Chat/ChatCreateBill.dart';
import 'package:project_it/Pages/Chat/ChatDetail.dart';
import 'package:project_it/Pages/Chat/ChatPage.dart';
import 'package:project_it/Pages/Friend/AddFriend.dart';
import 'package:project_it/Pages/Friend/FindFriendForm.dart';
import 'package:project_it/Pages/Friend/FriendListPage.dart';
import 'package:project_it/Pages/Group/GroupChatListPage.dart';
import 'package:project_it/Pages/Group/GroupCreatePage.dart';
import 'package:project_it/Pages/Group/GroupInvitePage.dart';
import 'package:project_it/Pages/Group/GroupNotificationPage.dart';
import 'package:project_it/Pages/Profile/ProfilePage.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/ButtomNavigationbar.dart';
import 'package:project_it/Widgets/Group/noGroup.dart';
import 'package:provider/provider.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  late Widget currentPreview;
  late List groupList;
  final Map<String, Widget> _RouterPages = {
    '/': const GroupChatListPage(),
    '/NoGroup': const NoGroupWidget(),
    '/GroupInvite': const GroupInvitePage(),
    '/GroupCreate': const GroupCreatePage(),
    '/GroupNotifications': const GroupNotificationPage(),
    '/GroupProfile': const ProfilePage(),
    '/FriendList': const FriendListPage(),
    '/AddFriend': const Addfriend(),
    '/AddFriendType': const AddFriendType(),
    '/ChatPage': const ChatPage(),
    '/ChatDetail': const ChatDetail(),
    '/ChatCreateBill': const ChatCreateBill(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routerProvider = Provider.of<RouterProvider>(context);
    currentPreview = _RouterPages[routerProvider.currentRoute['route']]!;
    return Scaffold(
      backgroundColor: Pallete.white,
      body: currentPreview,
      bottomNavigationBar: routerProvider.currentRoute['showBBar']
          ? BottomNavigationbar(
              currentRoute: routerProvider.currentRoute['route'],
            )
          : null,
    );
  }
}
