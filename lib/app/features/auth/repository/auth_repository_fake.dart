import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';

import 'auth_repository.dart';

class AuthRepositoryFake extends AuthRepository {
  @override
  Future<String> createAccount({required AuthModel auth}) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<String> login({required AuthModel auth}) {
    // TODO: implement login
    throw UnimplementedError();
  }

}
