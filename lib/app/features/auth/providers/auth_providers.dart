import 'package:doctor_appointment/app/features/auth/form_state/auth_state.dart';
import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../user/entity/user_model.dart';
import '../enum/auth_status.dart';
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
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      } else {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: UserModel(uid: user.uid, email: user.email),
        );
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(status: AuthStatus.authenticating);
    AuthModel authModel = AuthModel(email: email, password: password);
    AuthState authState = await _repo.login(auth: authModel);
    state = authState;
  }

  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    state = state.copyWith(status: AuthStatus.authenticating);
    AuthModel authModel =
        AuthModel(username: name, email: email, password: password);
    AuthState authState = await _repo.createAccount(auth: authModel);
    state = authState;
  }

  Future<void> logout() async {
    await _repo.signOut();
    state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
  }
}
