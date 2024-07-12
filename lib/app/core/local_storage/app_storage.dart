import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/user/model/user_model.dart';

class AppStorage {
  Box? _box;

  /// for initializing app local storage
  Future<void> initAppStorage() async {
    await Hive.initFlutter();
    // TODO: add your storage name here
    _box = await Hive.openBox('user_storage');
  }

  /// for storing user data
  Future<void> saveUser(UserModel user) async {
    await _box?.put('user', user.toMap());
  }

  /// for getting user data
  UserModel? getUser() {
    final userData = _box?.get('user');
    if (userData != null) {
      Map<String, dynamic> userMap = Map<String, dynamic>.from(userData);
      return UserModel.fromMap(userMap);
    }
    return null;
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _box?.clear();
  }
}

final appStorageProvider = Provider<AppStorage>(
      (_) {
    throw UnimplementedError();
  },
);
