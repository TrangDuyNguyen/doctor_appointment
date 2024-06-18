import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../user/model/user_model.dart';
import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStoreDB = FirebaseFirestore.instance;
  AuthRepositoryImpl();

  @override
  Future<AuthState> createAccount({required AuthModel auth}) async {
    // TODO: implement createAccount
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: auth.email ?? "",
        password: auth.password ?? "",
      );
      User user = userCredential.user!;

      await _fireStoreDB.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': auth.username,
        'email': user.email,
        'avatar': '',
        'displayName': user.displayName,
        'dateOfBirth':  Timestamp.fromDate(DateTime.now()),
        'phone': '',
        'gender': '',
        'dateCreate':  Timestamp.fromDate(DateTime.now()),
        'address': '',
        // Add other user details here if necessary
      });

      AuthState newState = AuthState(
        status: AuthStatus.authenticated,
        user: UserModel(uid: user.uid),
        accessToken: "",
      );
      return newState;
    } on FirebaseAuthException catch (e) {
      AuthState errorState = AuthState(
          status: AuthStatus.authenticatedError,
          errorMessage: "Failed to create. Please check your credentials.");
      return errorState;
    }
  }

  @override
  Future<AuthState> login({required AuthModel auth}) async {
    // TODO: implement login
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: auth.email ?? "",
        password: auth.password ?? "",
      );
      User user = userCredential.user!;
      AuthState newState = AuthState(
        status: AuthStatus.authenticated,
        user: UserModel(uid: user.uid),
        accessToken: "",
      );
      return newState;
    } on FirebaseAuthException catch (e) {
      AuthState errorState = AuthState(
          status: AuthStatus.authenticatedError,
          errorMessage: "Failed to login. Please check your credentials.");
      return errorState;
    }
  }

  @override
  Future signOut() async {
    // TODO: implement signOut
    await _firebaseAuth.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
