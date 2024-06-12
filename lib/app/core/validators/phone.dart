import 'package:formz/formz.dart';
import '../../../design/utils/ValidateUtils.dart';

enum PhoneValidationError { empty, invalid, mustNotEmpty, invalidPhoneNumber }

class Phone extends FormzInput<String, PhoneValidationError> {
  final bool isRequired;

  const Phone.pure({String value = '', this.isRequired = true})
      : super.pure(value);

  const Phone.dirty({
    String value = '',
    this.isRequired = true,
  }) : super.dirty(value);

  @override
  PhoneValidationError? validator(String? value) {
    final textTrim = value?.trim();
    if (isRequired == true && (textTrim == null || textTrim.isEmpty)) {
      return PhoneValidationError.empty;
    }
    return ValidateUtils.isPhoneNumber(textTrim ?? '')
        ? null
        : PhoneValidationError.invalid;
  }
}

extension PhoneValidationErrorEx on PhoneValidationError {
  String text() {
    switch (this) {
      case PhoneValidationError.empty:
        return 'Phone number must not be empty';
      case PhoneValidationError.invalid:
        return 'Invalid phone number';
      default:
        return '';
    }
  }
}
