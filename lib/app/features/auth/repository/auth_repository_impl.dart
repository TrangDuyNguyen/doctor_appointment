import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:doctor_appointment/app/features/auth/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../form_state/auth_state.dart';
import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthRepositoryImpl();

  @override
  Future<String> createAccount({required AuthModel auth}) async {
    // TODO: implement createAccount
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: auth.email ?? "",
        password: auth.password ?? "",
      );
      return userCredential.user?.uid ?? 'No UID';
    } on FirebaseAuthException catch (e) {
      return 'Error: ${e.message}';
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
        status: AuthStatus.unauthenticated,
      );
      return errorState;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
