import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String token;
  final String password;
  final courses;
  final avatarUrl;
  final roles;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.password,
    this.courses,
    this.avatarUrl,
    this.roles,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'password': password,
      'courses': courses,
      'avatarUrl': avatarUrl,
      'roles': roles,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
      courses: map['courses'] ?? '',
      roles: map['roles'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Users {
  final users;
  Users({
    this.users,
  });

  Map<String, dynamic> toMap() {
    return {
      'users': users,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      users: map['users'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));
}
