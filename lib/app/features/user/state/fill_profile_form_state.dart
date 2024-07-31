import 'package:doctor_appointment/app/core/validators/email.dart';
import 'package:doctor_appointment/app/core/validators/phone.dart';
import 'package:doctor_appointment/app/features/user/entity/user_model.dart';
import 'package:formz/formz.dart';

import '../../../core/validators/name.dart';

class FillProfileFormState with FormzMixin {
  final String avatar;
  final Name name;
  final DateTime dateOfBirth;
  final Email email;
  final Phone phone;
  final String gender;
  final FormzSubmissionStatus status;

  factory FillProfileFormState.fake() {
    return FillProfileFormState(
      avatar: '',
      name: const Name.pure('Nguyen Duy Trang'),
      email: const Email.pure('trangndps10349@gmail.com'),
      dateOfBirth: DateTime.now(),
      phone: const Phone.pure(value: '0397308962'),
      gender: 'Male',
      status: FormzSubmissionStatus.initial,
    );
  }

  factory FillProfileFormState.initial(UserModel? userModel) {
    return FillProfileFormState(
      avatar: userModel?.avatar ?? "",
      name: Name.pure(userModel?.displayName ?? ""),
      email: Email.pure(userModel?.email ?? ""),
      dateOfBirth: userModel?.dateOfBirth ?? DateTime.now(),
      phone: Phone.pure(value: userModel?.phone ?? ""),
      gender: userModel?.gender,
      status: FormzSubmissionStatus.initial,
    );
  }

  FillProfileFormState({
    String? avatar,
    Name? name,
    Email? email,
    DateTime? dateOfBirth,
    Phone? phone,
    String? gender,
    this.status = FormzSubmissionStatus.initial,
  })  : name = name ?? const Name.pure(),
        email = email ?? const Email.pure(),
        dateOfBirth = dateOfBirth ?? DateTime.now(),
        phone = phone ?? const Phone.pure(),
        gender = gender ?? '',
        avatar = avatar ?? '';

  FillProfileFormState copyWith({
    String? avatar,
    Name? name,
    Email? email,
    DateTime? dateOfBirth,
    Phone? phone,
    String? gender,
    FormzSubmissionStatus? status,
  }) {
    return FillProfileFormState(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}
