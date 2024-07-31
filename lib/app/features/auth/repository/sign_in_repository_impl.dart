import 'package:doctor_appointment/app/features/auth/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../user/entity/user_model.dart';
import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import '../model/auth_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  SignInRepositoryImpl();

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
}

final signInRepositoryProvider = Provider<SignInRepository>((ref) {
  return SignInRepositoryImpl();
});
