import 'package:doctor_appointment/app/features/user/model/user_model.dart';

import '../state/user_state.dart';

abstract class UserRepository {
  Future<UserState> createUser({
    required UserModel userModel,
  });

  Future<UserState> editUser({
    required UserModel userModel,
  });

  Future<UserState> deleteUser({
    required String userId,
  });

  Future<List<UserModel>> listUsers({
    int? limit,
    int? offset,
  });

  Future<List<UserModel>> searchUsers({
    required String query,
  });

  Future<UserState> getUserById({
    required String userId,
  });
}
