import 'package:formz/formz.dart';

class FormAuthState with FormzMixin {
  final String name;
  final String email;
  final String password;
  final String cfPassword;
  final FormzSubmissionStatus status;

  FormAuthState({
    String? name,
    String? email,
    String? password,
    String? cfPassword,
    this.status = FormzSubmissionStatus.initial,
  })  : name = name ?? "",
        email = email ?? "",
        password = password ?? "",
        cfPassword = cfPassword ?? "";

  FormAuthState copyWith({
    String? name,
    String? email,
    String? password,
    String? cfPassword,
    FormzSubmissionStatus? status,
  }) {
    return FormAuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      cfPassword: cfPassword ?? this.cfPassword,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();

}
