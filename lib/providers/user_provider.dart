import 'package:flutter/material.dart';
import 'package:alippepro_v1/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user =
      User(id: '', name: '', avatarUrl:'', email: '', token: '', password: '', courses: []);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
