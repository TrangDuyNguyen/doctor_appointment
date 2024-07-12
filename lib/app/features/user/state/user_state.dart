import '../model/user_model.dart';

enum UserStatus { loading, success, failure, initialize, updateSuccess }

class UserState {
  final UserModel? user;
  final UserStatus status;
  final String? errorMessage;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  UserState({
    this.user,
    this.status = UserStatus.initialize,
    this.errorMessage,
  });

  UserState copyWith({
    UserModel? user,
    UserStatus? status,
    String? errorMessage,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory UserState.initial(UserModel user) {
    return UserState(
      user: user,
      status: UserStatus.initialize,
      errorMessage: null,
    );
  }

  @override
  String toString() =>
      'UserState(user: $user, status: $status, errorMessage: $errorMessage)';
}
