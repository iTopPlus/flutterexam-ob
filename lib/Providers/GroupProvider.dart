import 'package:flutter/material.dart';
import 'package:project_it/Providers/InviteProvider.dart';
import 'package:provider/provider.dart';

class GroupProvider with ChangeNotifier {
  List<Map<String, dynamic>> groupList = [];

  void createGroup(
    String groupName,
    int owner,
    String groupImg,
    BuildContext context,
  ) {
    final inviteProvider = Provider.of<InviteProvider>(context, listen: false);

    final newGroup = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'Group_name': groupName,
      'Group_owner': owner,
      'Group_img': groupImg,
      'Group_members': inviteProvider.invitedUsers,
    };

    groupList.add(newGroup);

    notifyListeners();
  }
}
