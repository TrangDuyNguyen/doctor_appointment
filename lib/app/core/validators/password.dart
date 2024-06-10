import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort, tooLong, invalid, mismatch }

/// Passwords must be 8-20 characters with at least 1 number,
/// 1 letter and 1 special symbol.
/// 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character
bool isPassword(String s) {
  const regex = r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,20}$';
  return RegExp(regex).hasMatch(s);
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    final textTrim = value?.trim();

    if (textTrim == null || textTrim.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (textTrim.length < 8) {
      return PasswordValidationError.tooShort;
    }

    if (textTrim.length > 20) {
      return PasswordValidationError.tooLong;
    }

    if (!isPassword(textTrim)) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}

class ConfirmPassword extends FormzInput<String, PasswordValidationError> {
  final String password;

  const ConfirmPassword.pure({this.password = '', String value = ''})
      : super.pure(value);

  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    return value == password ? null : PasswordValidationError.mismatch;
  }
}

extension PasswordValidationErrorExtention on PasswordValidationError {
  String? text() {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password is required';
      case PasswordValidationError.tooShort:
        return 'Password is too short';
      case PasswordValidationError.tooLong:
        return 'Password is too long';
      case PasswordValidationError.invalid:
        return 'Password is invalid format';
      case PasswordValidationError.mismatch:
        return 'Password is mismatch';
      default:
        return null;
    }
  }
}
