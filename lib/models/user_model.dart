import 'dart:convert';

class UserModel {
  final String type;
  final String name;
  final String storing;
  final String user;
  final String password;
  UserModel({
    this.type,
    this.name,
    this.storing,
    this.user,
    this.password,
  });

  UserModel copyWith({
    String type,
    String name,
    String storing,
    String user,
    String password,
  }) {
    return UserModel(
      type: type ?? this.type,
      name: name ?? this.name,
      storing: storing ?? this.storing,
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'storing': storing,
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      type: map['type'],
      name: map['name'],
      storing: map['storing'],
      user: map['user'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(type: $type, name: $name, storing: $storing, user: $user, password: $password)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.type == type &&
      o.name == name &&
      o.storing == storing &&
      o.user == user &&
      o.password == password;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      name.hashCode ^
      storing.hashCode ^
      user.hashCode ^
      password.hashCode;
  }
}
