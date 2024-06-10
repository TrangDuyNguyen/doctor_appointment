import 'package:formz/formz.dart';
import '../../../design/utils/ValidateUtils.dart';

enum EmailValidationError { mustNotEmpty, invalidEmail }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.mustNotEmpty;
    }

    final textTrim = value.trim();

    if (!ValidateUtils.isEmail(textTrim)) {
      return EmailValidationError.invalidEmail;
    }

    return null;
  }
}

extension EmailValidationErrorExtention on EmailValidationError {
  String text() {
    switch (this) {
      case EmailValidationError.mustNotEmpty:
        return 'Email must not be empty';
      case EmailValidationError.invalidEmail:
        return 'Invalid email';
      default:
        return '';
    }
  }
}
