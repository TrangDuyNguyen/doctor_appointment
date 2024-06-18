import 'dart:async';

import 'package:doctor_appointment/app/features/user/model/user_model.dart';
import 'package:doctor_appointment/app/features/user/state/user_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/user_repository.dart';
import '../repository/user_repository_impl.dart';

final userNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return UserStateNotifier(repo);
});

class UserStateNotifier extends StateNotifier<UserState> {
  final UserRepository _repo;

  UserStateNotifier(this._repo, [UserState? state])
      : super(state ?? UserState.initial());

  Future<void> createUser(UserModel userModel) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.createUser(userModel: userModel);
    state = userState;
  }

  FutureOr<UserModel?> getUserById(String userId) async {
    state = state.copyWith(status: UserStatus.loading);
    UserState userState = await _repo.getUserById(userId: userId);
    state = userState;
    return userState.user;
  }
}
