import 'package:doctor_appointment/app/features/auth/repository/create_acc_repository.dart';
import 'package:doctor_appointment/app/features/auth/repository/create_acc_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

final createAccNotifierProvider =
    StateNotifierProvider<CreateAccStateNotifier, AuthState>((ref) {
  final repo = ref.watch(createAccRepositoryProvider);
  return CreateAccStateNotifier(repo);
});

class CreateAccStateNotifier extends StateNotifier<AuthState> {
  final CreateAccRepository _repo;

  CreateAccStateNotifier(this._repo, [AuthState? state])
      : super(state ?? AuthState.initial());

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
}
