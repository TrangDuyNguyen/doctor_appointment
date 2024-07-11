import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/features/auth/repository/create_acc_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/local_storage/app_storage.dart';
import '../../user/model/user_model.dart';
import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

class CreateAccRepositoryImpl implements CreateAccRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStoreDB = FirebaseFirestore.instance;
  final AppStorage _appStorage;

  CreateAccRepositoryImpl(this._appStorage);

  @override
  Future<AuthState> createAccount({required AuthModel auth}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: auth.email ?? "",
        password: auth.password ?? "",
      );
      User user = userCredential.user!;

      await _appStorage.clearAllData();

      UserModel newUser = UserModel(
        uid: user.uid,
        userName: auth.username,
        email: user.email,
        fullName: user.displayName,
        dateOfBirth: DateTime.now(),
        phone: '',
        gender: '',
        dateCreate: DateTime.now(),
        address: '',
      );

      await _fireStoreDB.collection('users').doc(user.uid).set(newUser.toMap());

      // Save the user to local storage
      await _appStorage.saveUser(newUser);

      AuthState newState = AuthState(
        status: AuthStatus.authenticated,
        user: newUser,
        accessToken: "",
      );
      return newState;
    } on FirebaseAuthException catch (e) {
      AuthState errorState = AuthState(
        status: AuthStatus.authenticatedError,
        errorMessage: "Failed to create. Please check your credentials.",
      );
      return errorState;
    }
  }
}

final createAccRepositoryProvider = Provider<CreateAccRepository>((ref) {
  final appStorage = ref.read(appStorageProvider);
  return CreateAccRepositoryImpl(appStorage);
});