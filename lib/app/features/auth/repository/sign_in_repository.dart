import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

abstract class SignInRepository {
  Future<AuthState> login({
    required AuthModel auth
  });
}