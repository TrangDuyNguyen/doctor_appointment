import 'package:formz/formz.dart';
import '../../../design/utils/ValidateUtils.dart';

enum NameValidationError { invalid, mustNotEmpty }

class Name extends FormzInput<String, NameValidationError> {
  final bool isRequire;

  const Name.pure([super.value = '', this.isRequire = true]) : super.pure();

  const Name.dirty([
    super.value = '',
    this.isRequire = true,
  ]) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    final trimValue = value?.trim();
    if (isRequire == true && (trimValue == null || trimValue.isEmpty == true)) {
      return NameValidationError.mustNotEmpty;
    }
    // Add your custom validation logic here
    // you can check if the name contains only letters
    // using a regular expression
    if (!ValidateUtils.isValidLastNameUserContact(value)) {
      return NameValidationError.invalid;
    }
    return null;
  }
}

extension NameValidationErrorExtension on NameValidationError {
  String text() {
    switch (this) {
      case NameValidationError.mustNotEmpty:
        return 'The field is required';
      case NameValidationError.invalid:
        return 'Invalid name';
      default:
        return '';
    }
  }
}
