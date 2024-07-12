import 'dart:async';

import 'package:doctor_appointment/app/features/user/model/user_model.dart';
import 'package:doctor_appointment/app/features/user/state/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/local_storage/app_storage.dart';
import '../repository/user_repository.dart';
import '../repository/user_repository_impl.dart';

final userNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  final repo = ref.watch(userRepositoryProvider);
  final appStorage = ref.read(appStorageProvider);
  return UserStateNotifier(repo, appStorage);
});

class UserStateNotifier extends StateNotifier<UserState> {
  final UserRepository _repo;
  final AppStorage _appStorage;

  UserStateNotifier(this._repo, this._appStorage, [UserState? state])
      : super(state ??
            UserState.initial(_appStorage.getUser() ?? UserModel(uid: ""))) {
    _checkUserLocal();
  }

  Future<void> _checkUserLocal() async {
    state = state.copyWith(status: UserStatus.loading);

    // Check if the user is saved locally
    UserModel? localUser = _appStorage.getUser();

    if (localUser != null) {
      state = state.copyWith(
        user: localUser,
        status: UserStatus.success,
      );
    } else {
      // Check if there is a currently signed-in user with FirebaseAuth
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        UserState userState = await _repo.getUserById(userId: firebaseUser.uid);
        if (userState.user != null) {
          await _appStorage.saveUser(userState.user!);
          state = userState.copyWith(status: UserStatus.success);
        } else {
          state = state.copyWith(
            status: UserStatus.failure,
            errorMessage: "User not found",
          );
        }
      } else {
        state = state.copyWith(
          status: UserStatus.failure,
          errorMessage: "No user signed in",
        );
      }
    }
  }

  Future<void> updateUserLocalDB(UserModel userModel) async {
    state = state.copyWith(status: UserStatus.loading);
    await _appStorage.saveUser(userModel);
    state = state.copyWith(user: userModel, status: UserStatus.updateSuccess);
  }

  Future<void> createUser(UserModel userModel) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.createUser(userModel: userModel);
    if (userState.status == UserStatus.success) {
      await _appStorage.saveUser(userState.user!);
    }
    state = userState;
  }

  Future<void> updateUser(UserModel userModel) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.editUser(userModel: userModel);
    if (userState.status == UserStatus.success) {
      await _appStorage.saveUser(userState.user!);
    }
    state = userState;
  }

  Future<void> deleteUser(String userId) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.deleteUser(userId: userId);
    if (userState.status == UserStatus.success) {
      await _appStorage.clearAllData();
    }
    state = userState;
  }

  FutureOr<UserModel?> getUserById(String userId) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.getUserById(userId: userId);
    state = userState;
    return userState.user;
  }
}
