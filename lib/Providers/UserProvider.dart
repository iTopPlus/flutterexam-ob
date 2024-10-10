import 'package:flutter/foundation.dart';
import 'package:project_it/Models/User.dart';

class UserProvider with ChangeNotifier {
  final List<User> _usersList = [
    User(id: 0, name: 'Anantapong', imageUrl: 'assets/images/example/0.png', phone: '1234567890'),
    User(id: 1, name: 'Natdanai', imageUrl: 'assets/images/example/0.png', phone: '123'),
    User(id: 2, name: 'Thanan', imageUrl: 'assets/images/example/1.png', phone: '456'),
    User(id: 3, name: 'Oranit', imageUrl: 'assets/images/example/2.png', phone: '789'),
    User(id: 4, name: 'Mintra', imageUrl: 'assets/images/example/3.png', phone: '0123'),
    User(id: 5, name: 'Saranya', imageUrl: 'assets/images/example/4.png', phone: '0456'),
  ];

  List<User> get usersList => _usersList;

  void addUser(int id) {
    final user = _usersList.firstWhere(
        (user) => user.id == id,
        orElse: () => User(id: id, name: 'Unknown', imageUrl: '', phone: ''));
    if (user.name != 'Unknown' && !user.checked) {
      user.checked = true;
      notifyListeners();
    }
  }

  void removeUser(int id) {
    final user = _usersList.firstWhere(
        (user) => user.id == id,
        orElse: () => User(id: id, name: 'Unknown', imageUrl: '', phone: ''));
    if (user.name != 'Unknown' && user.checked) {
      user.checked = false;
      notifyListeners();
    }
  }
}
