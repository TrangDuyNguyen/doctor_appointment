import 'package:dio/dio.dart';
import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImpl(this._dio);

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

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(Dio());
});
