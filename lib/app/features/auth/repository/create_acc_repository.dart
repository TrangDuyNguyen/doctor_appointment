import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

abstract class CreateAccRepository {
  Future<AuthState> createAccount({
    required AuthModel auth
  });
}