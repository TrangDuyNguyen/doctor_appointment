import 'package:doctor_appointment/app/features/auth/repository/sign_in_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import '../model/auth_model.dart';
import '../repository/sign_in_repository_impl.dart';

final signInNotifierProvider =
    StateNotifierProvider<SignInStateNotifier, AuthState>((ref) {
  final repo = ref.watch(signInRepositoryProvider);
  return SignInStateNotifier(repo);
});

class SignInStateNotifier extends StateNotifier<AuthState> {
  final SignInRepository _repo;

  SignInStateNotifier(this._repo, [AuthState? state])
      : super(state ?? AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(status: AuthStatus.authenticating);
    AuthModel authModel = AuthModel(email: email, password: password);
    AuthState authState = await _repo.login(auth: authModel);
    state = authState;
  }
}
