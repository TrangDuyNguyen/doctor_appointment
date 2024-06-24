import 'dart:convert';

class UserModel {
  final String? userName;
  final String? email;
  final String? avatar;
  final String? uid;
  final String? fullName;
  final DateTime? dateOfBirth;
  final String? phone;
  final String? gender;
  final DateTime? dateCreate;
  final String? address;

  UserModel({
    required this.uid,
    this.fullName,
    this.userName,
    this.email,
    this.avatar,
    this.dateOfBirth,
    this.phone,
    this.gender,
    this.dateCreate,
    this.address,
  });

  @override
  String toString() => 'name $userName email $email avatar $avatar';

  String get displayName => fullName?.isNotEmpty == true ? fullName! : userName ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': userName,
      'email': email,
      'avatar': avatar,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'phone': phone,
      'gender': gender,
      'dateCreate': dateCreate?.toIso8601String(),
      'address': address,
    };
  }

  UserModel copyWith({
    String? userName,
    String? email,
    String? avatar,
    String? uid,
    String? fullName,
    DateTime? dateOfBirth,
    String? phone,
    String? gender,
    DateTime? dateCreate,
    String? address,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dateCreate: dateCreate ?? this.dateCreate,
      address: address ?? this.address,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw ArgumentError('Invalid user data');
    }
    return UserModel(
      uid: map['uid'] as String,
      userName: map['name'] as String?,
      email: map['email'] as String?,
      avatar: map['avatar'] as String?,
      fullName: map['fullName'] as String?,
      dateOfBirth: map['dateOfBirth'] != null ? DateTime.parse(map['dateOfBirth'] as String) : null,
      phone: map['phone'] as String?,
      gender: map['gender'] as String?,
      dateCreate: map['dateCreate'] != null ? DateTime.parse(map['dateCreate'] as String) : null,
      address: map['address'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}