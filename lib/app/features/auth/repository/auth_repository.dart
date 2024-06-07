import '../model/auth_model.dart';

abstract class AuthRepository {
  Future<String> login({
    required AuthModel auth
  });

  Future<String> createAccount({
    required AuthModel auth
  });
}
