import 'package:doctor_appointment/app/features/user/entity/user_model.dart';
import 'package:doctor_appointment/app/features/user/model/profile_model.dart';
import 'package:image_picker/image_picker.dart';

import '../state/user_state.dart';

abstract class UserRepository {
  Future<UserState> createUser({
    required UserModel userModel,
  });

  Future<UserState> editUser({required UserModel userModel});

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

  Future<String> uploadAvatar({required XFile avatar, required String uid});
}
