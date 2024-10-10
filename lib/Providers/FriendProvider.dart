import 'package:flutter/foundation.dart';

class FriendProvider with ChangeNotifier {
  List<Map<String, dynamic>> _friendList =  [
  // {
  //   'name': 'Natdanai',
  //   'checked': false,
  //   'imageUrl': 'assets/images/example/0.png',
  //   'invitedAt': '2024-10-10 16:54:42.569274'
  // },
  // {
  //   'name': 'Thanan',
  //   'checked': false,
  //   'imageUrl': 'assets/images/example/1.png',
  //   'invitedAt': '2024-10-10 16:54:42.816166'
  // }
];

  List<Map<String, dynamic>> get friendList => _friendList;

  void addFriend(Map<String, dynamic> newUser) {
    if (!_friendList.any((user) => user['id'] == newUser['id'])) {
      _friendList.add(newUser);
      notifyListeners();
    }
  }

  void removeFriend(int id) {
    _friendList.removeWhere((user) => user['id'] == id);
    notifyListeners();
  }
}
