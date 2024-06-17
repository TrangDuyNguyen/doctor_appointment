import 'dart:convert';

class UserModel {
  final String? userName;
  final String? email;
  final String? avatar;
  final String? uid;
  final String? displayName;

  UserModel(
      {required this.uid,
      this.displayName,
      this.userName,
      this.email,
      this.avatar});

  @override
  String toString() => 'name $userName email $email avatar $avatar';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': userName,
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
      userName: name ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      userName: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
