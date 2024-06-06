import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:flutter/material.dart';

class AppColors {
  late final ThemeData _themeData;

  AppColors._(this._themeData);

  static AppColors of(BuildContext context) {
    return AppColors._(Theme.of(context));
  }

  Color get brandPrimary => const Color(0xFF92A3FD);
  Color get brandSecondary => const Color(0xFF9DCEFF);
  Color get tertiary => const Color(0xffEBEAEC);
  Color get secondaryColor => const Color(0xFFC58BF2);
  Color get blackColor => const Color(0xFF1D1617);
  Color get whiteColor => const Color(0xFFFFFFFF);
  Color get grayColorDark => const Color(0xFF7B6F72);
  Color get grayColorMedium => const Color(0xFFA4A5A6);
  Color get grayColorLight => const Color(0xFFDADADA);
  Color get borderColor => const Color(0xFFF7F8F8);
  Color get primaryText => const Color(0xff3F414E);
  Color get secondaryText => const Color(0xffA1A4B2);
  Color get textFieldColor => const Color(0xffCCD1D9);
  Color get error => const Color(0xffff0000);

  LinearGradient get brandPrimaryGradient => LinearGradient(
        colors: [brandSecondary, brandPrimary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

extension ThemesExtension on BuildContext {
  AppColors get appColors => AppColors.of(this);

  AppTextStyles get appTextStyles => AppTextStyles.of(this);

  AppTextStyles appTextStylesWithColor(Function(AppColors appColors) getColor) {
    return appTextStyles.copyWith(color: getColor(appColors));
  }
}

extension HexColor on Color {
  static Color formHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#", ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
