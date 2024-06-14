import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

abstract class AuthRepository {
  Future<AuthState> login({
    required AuthModel auth
  });

  Future<String> createAccount({
    required AuthModel auth
  });
}
