import 'package:doctor_appointment/app/core/validators/email.dart';
import 'package:doctor_appointment/app/core/validators/name.dart';
import 'package:doctor_appointment/app/core/validators/password.dart';
import 'package:formz/formz.dart';


class FormAuthState with FormzMixin {
  final Name name;
  final Email email;
  final Password password;
  final ConfirmPassword cfPassword;
  final FormzSubmissionStatus status;

  factory FormAuthState.fake() {
    return FormAuthState(
      name: const Name.pure('Nguyen Duy Trang'),
      email: const Email.pure('trangndps10349@gmail.com'),
      password: const Password.pure('012@Aaaa'),
      cfPassword: const ConfirmPassword.pure(
        password: '012@Aaaa',
        value: '012@Aaaa',
      ),
      status: FormzSubmissionStatus.initial,
    );
  }

  factory FormAuthState.initial() {
    // if (AppConfig.instance.isDebugMode) {
    return FormAuthState.fake();
    // }
    // return FormAuthState(
    //   name: const Name.pure(),
    //   email: const Email.pure(),
    //   password: const Password.pure(),
    //   cfPassword: const ConfirmPassword.pure(),
    //   status: FormzSubmissionStatus.initial,
    // );
  }

  FormAuthState({
    Name? name,
    Email? email,
    Password? password,
    ConfirmPassword? cfPassword,
    this.status = FormzSubmissionStatus.initial,
  })  : name = name ?? const Name.pure(),
        email = email ?? const Email.pure(),
        password = password ?? const Password.pure(),
        cfPassword = cfPassword ?? const ConfirmPassword.pure();

  FormAuthState copyWith({
    Name? name,
    Email? email,
    Password? password,
    ConfirmPassword? cfPassword,
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
  List<FormzInput> get inputs => [name, email, password, cfPassword];
}
