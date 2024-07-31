import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class ProfileModel {
  final String? userName;
  final String? email;
  final XFile? avatar;
  final String? uid;
  final String? fullName;
  final DateTime? dateOfBirth;
  final String? phone;
  final String? gender;
  final DateTime? dateCreate;
  final String? address;

  ProfileModel({
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

  String get displayName =>
      fullName?.isNotEmpty == true ? fullName! : userName ?? '';

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

  ProfileModel copyWith({
    String? userName,
    String? email,
    XFile? avatar,
    String? uid,
    String? fullName,
    DateTime? dateOfBirth,
    String? phone,
    String? gender,
    DateTime? dateCreate,
    String? address,
  }) {
    return ProfileModel(
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

  factory ProfileModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw ArgumentError('Invalid user data');
    }
    return ProfileModel(
      uid: map['uid'] as String,
      userName: map['name'] as String?,
      email: map['email'] as String?,
      avatar: map['avatar'] as XFile?,
      fullName: map['fullName'] as String?,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'] as String)
          : null,
      phone: map['phone'] as String?,
      gender: map['gender'] as String?,
      dateCreate: map['dateCreate'] != null
          ? DateTime.parse(map['dateCreate'] as String)
          : null,
      address: map['address'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
