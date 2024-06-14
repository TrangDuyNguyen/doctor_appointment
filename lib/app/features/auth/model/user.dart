import 'dart:convert';

class UserModel {
  final String? name;
  final String? email;
  final String? avatar;
  final String? uid;
  final String? displayName;

  UserModel(
      {required this.uid,
      this.displayName,
      this.name,
      this.email,
      this.avatar});

  @override
  String toString() => 'name $name email $email avatar $avatar';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? avatar,
    String? uid,
    String? displayName,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
