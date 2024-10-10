import 'package:flutter/material.dart';

class InviteProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _invitedUsers = [];

  List<Map<String, dynamic>> get invitedUsers => _invitedUsers;

  void invite(String name, String imageUrl, bool checked) {
    int existingUserIndex = _invitedUsers.indexWhere((user) => user['name'] == name);

    if (existingUserIndex != -1) {
      _invitedUsers[existingUserIndex]['checked'] = !_invitedUsers[existingUserIndex]['checked'];
    } else {
      Map<String, dynamic> user = {
        'name': name,
        'checked': checked,
        'imageUrl': imageUrl,
        'invitedAt': DateTime.now().toString(),
      };
      _invitedUsers.add(user);
    }

    removeUncheckedUsers();
    notifyListeners();
  }

  void removeUser(String name) {
    _invitedUsers.removeWhere((user) => user['name'] == name);
    notifyListeners();
  }

  void removeUncheckedUsers() {
    _invitedUsers.removeWhere((user) => !user['checked']);
    notifyListeners();
  }

  void reset() {

    _invitedUsers.clear();
    notifyListeners();
  }

  List<Map<String, dynamic>> getSelectedUsers() {
    return _invitedUsers.where((user) => user['checked']).toList();
  }
}
