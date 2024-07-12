import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/features/auth/model/auth_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/local_storage/app_storage.dart';
import '../../user/model/user_model.dart';
import '../enum/auth_status.dart';
import '../form_state/auth_state.dart';
import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStoreDB = FirebaseFirestore.instance;
  final AppStorage _appStorage;

  AuthRepositoryImpl(this._appStorage);

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

      // Check if user data is saved correctly
      UserModel? localUser = _appStorage.getUser();
      if (localUser != null) {
        print("User data saved locally: ${localUser.toMap()}");
      } else {
        print("Failed to save user data locally.");
      }

      AuthState newState = AuthState(
        status: AuthStatus.authenticated,
        user: newUser,
        accessToken: "",
      );
      return newState;
    } on FirebaseAuthException catch (e) {
      AuthState errorState = AuthState(
        status: AuthStatus.createAccError,
        errorMessage: "Failed to create. Please check your credentials.",
      );
      return errorState;
    }
  }

  @override
  Future<AuthState> login({required AuthModel auth}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: auth.email ?? "",
        password: auth.password ?? "",
      );
      User user = userCredential.user!;

      // Clear old user data
      await _appStorage.clearAllData();

      // Fetch or create user data from Firestore
      DocumentSnapshot userDoc = await _fireStoreDB.collection('users').doc(user.uid).get();
      UserModel loggedInUser;
      if (userDoc.exists) {
        loggedInUser = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        loggedInUser = UserModel(
          uid: user.uid,
          userName: user.displayName ?? "",
          email: user.email,
          fullName: user.displayName ?? "",
          dateOfBirth: DateTime.now(),
          phone: '',
          gender: '',
          dateCreate: DateTime.now(),
          address: '',
        );
        await _fireStoreDB.collection('users').doc(user.uid).set(loggedInUser.toMap());
      }

      // Save the user to local storage
      await _appStorage.saveUser(loggedInUser);

      // Check if user data is saved correctly
      UserModel? localUser = _appStorage.getUser();
      if (localUser != null) {
        print("User data saved locally: ${localUser.toMap()}");
      } else {
        print("Failed to save user data locally.");
      }

      AuthState newState = AuthState(
        status: AuthStatus.authenticated,
        user: loggedInUser,
        accessToken: "",
      );
      return newState;
    } on FirebaseAuthException catch (e) {
      AuthState errorState = AuthState(
        status: AuthStatus.authenticatedError,
        errorMessage: "Failed to login. Please check your credentials.",
      );
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
  final appStorage = ref.read(appStorageProvider);
  return AuthRepositoryImpl(appStorage);
});
