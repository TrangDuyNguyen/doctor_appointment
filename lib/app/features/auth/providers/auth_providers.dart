import 'package:doctor_appointment/app/features/auth/form_state/auth_state.dart';
import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';
import '../repository/auth_repository_impl.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(repo);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  AuthStateNotifier(this._repo, [AuthState? state])
      : super(state ?? AuthState.initial()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {

  }

  Future<void> login({required String email, required String password}) async {
    _repo.login(auth: AuthModel(email: email, password: password));
  }

  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {}

  Future<void> logout() async {}
}
