import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/features/user/model/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../state/user_state.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _fireStoreDB = FirebaseFirestore.instance;
  UserRepositoryImpl();

  @override
  Future<UserState> createUser({required UserModel userModel}) async {
    // TODO: implement createUser
    try {
      await _fireStoreDB
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toMap());
      UserState newState = UserState(status: UserStatus.success);
      return newState;
    } on FirebaseException catch (e) {
      UserState error =
          UserState(status: UserStatus.failure, errorMessage: e.message);
      return error;
    }
  }

  @override
  Future<UserState> deleteUser({required String userId}) async {
    try {
      await _fireStoreDB.collection('users').doc(userId).delete();
      UserState newState = UserState(status: UserStatus.success);
      return newState;
    } on FirebaseException catch (e) {
      UserState error =
          UserState(status: UserStatus.failure, errorMessage: e.message);
      return error;
    }
  }

  @override
  Future<UserState> editUser({required UserModel userModel}) async {
    try {
      await _fireStoreDB
          .collection('users')
          .doc(userModel.uid)
          .update(userModel.toMap());
      UserState newState = UserState(status: UserStatus.updateSuccess);
      return newState;
    } on FirebaseException catch (e) {
      UserState error =
          UserState(status: UserStatus.failure, errorMessage: e.message);
      return error;
    }
  }

  @override
  Future<UserState> getUserById({required String userId}) async {
    try {
      DocumentSnapshot doc =
      await _fireStoreDB.collection('users').doc(userId).get();
      if (doc.exists && doc.data() != null) {
        UserState newState = UserState(
            status: UserStatus.success,
            user: UserModel.fromMap(doc.data() as Map<String, dynamic>));
        return newState;
      } else {
        throw Exception('User not found');
      }
    } on FirebaseException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  @override
  Future<List<UserModel>> listUsers({int? limit, int? offset}) async {
    QuerySnapshot query =
        await _fireStoreDB.collection('users').limit(limit ?? 20).get();
    return query.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<UserModel>> searchUsers({required String query}) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreDB
          .collection('users')
          .where('fullName', isGreaterThanOrEqualTo: query)
          .where('fullName', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }
}

class _firebaseStorage {
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});
