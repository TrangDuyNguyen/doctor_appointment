import 'regex_extension.dart';

class ValidateUtils {
  ValidateUtils._();

  static bool isValidLength(String? target, {int? maxLength}) {
    if (target != null && (target.length) <= (maxLength ?? 256)) {
      return target.isNotEmpty;
    }
    return false;
  }

  static bool isNotEmpty(String? target) {
    if (target != null) {
      return target.trim().isNotEmpty;
    }
    return false;
  }

  static bool isValidNumber(String? target) {
    if (target != null) {
      num? number = num.tryParse(target.trim());
      if (number != null) return true;
    }
    return false;
  }

  static bool isValidInteger(String? target) {
    if (target != null) {
      int? number = int.tryParse(target.trim());
      if (number != null) return true;
    }
    return false;
  }

  @Deprecated("replace by isPhoneNumberLib")
  static bool isValidPhone(String? target) {
    if (target != null && target.length >= 8 && target.length <= 13) {
      return target.isNotEmpty && target.isPhone() == true;
    }
    return false;
  }

  ///max length (iso : max 3 ; 1 character special (+), space 3 character , 13 max number phone) => 20
  static bool isValidPhoneTemp(String? target, {bool? checkAll}) {
    if (target != null && target.length >= 8 && target.length <= 20) {
      return target.isNotEmpty && target.isPhoneTemp(checkAll: checkAll);
    }
    return false;
  }

  // static Future<bool> isPhoneNumberLib(String? phoneNumber, String? isoCode) {
  //   if (phoneNumber.isNullOrEmpty() || isoCode.isNullOrEmpty()) {
  //     return Future.value(false);
  //   }
  //   try {
  //     return PhoneUtil.getNameForNumber(
  //       phoneNumber: phoneNumber!,
  //       isoCode: isoCode!,
  //     ).then((value) {
  //       return value != null;
  //     });
  //   } catch (e) {
  //     return Future.value(false);
  //   }
  // }

  static bool isValidMail(String? target) {
    if (target != null) {
      return target.isNotEmpty && target.isEmail() == true;
    }
    return false;
  }

  static bool isHaveSpecialCharacter(String? target) {
    if (target != null) {
      return target.isNotEmpty && target.isSpecialCharacter() == true;
    }
    return false;
  }

  static bool isHaveAccent(String? target) {
    if (target != null) {
      return target.isNotEmpty && target.isHaveAccents() == true;
    }
    return false;
  }

  ///Last name must contant at least 2 lowercase characters (a–z) or uppercase characters (A–Z)
  /// Not have special character
  static bool isValidLastNameContactPayment(String? target) {
    if (target != null) {
      return target.isNotEmpty && !target.isSpecialCharacter();
    }
    return false;
  }

  static bool isValidFirstNameContactPayment(String? target) {
    if (target != null) {
      return target.isNotEmpty && !target.isSpecialCharacter();
    }
    return false;
  }

  static bool isValidFirstNameUserContact(String? target) {
    if (target != null) {
      return target.isNotEmpty && !target.isSpecialCharacter();
    }
    return false;
  }

  static bool isValidLastNameUserContact(String? target) {
    if (target != null) {
      return target.isNotEmpty && !target.isSpecialCharacter();
    }
    return false;
  }

  static bool isValidFirstNameGuest(String? target) {
    if (target != null) {
      return target.isNotEmpty &&
          !target.isSpecialCharacter() &&
          !target.isHaveAccents();
    }
    return false;
  }

  static bool isValidLastNameGuest(String? target) {
    if (target != null) {
      return target.isNotEmpty &&
          !target.isSpecialCharacter() &&
          !target.isHaveAccents();
    }
    return false;
  }

  static bool isEmail(String? value) {
    if (value != null) {
      return value.isNotEmpty && value.isEmail() == true;
    }
    return false;
  }

  static bool isPhoneNumber(String value) {
    return value.isNotEmpty && value.isPhone() == true;
  }
}
