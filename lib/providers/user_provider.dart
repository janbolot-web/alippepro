import 'package:flutter/material.dart';
import 'package:alippepro/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      avatarUrl: '',
      email: '',
      token: '',
      password: '',
      courses: []);

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

class UsersProvider extends ChangeNotifier {
  Users _users = Users(users: []);

  Users get users => _users;

  void setUsers(String users) {
    _users = Users.fromJson(users);
    notifyListeners();
  }

  void setUserFromModel(Users users) {
    _users = users;
    notifyListeners();
  }
}
