class AuthModel {
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;

  const AuthModel({
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
  });

  AuthModel copyWith(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword}) {
    return AuthModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
