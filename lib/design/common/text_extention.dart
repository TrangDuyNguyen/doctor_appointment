import 'package:flutter/material.dart';

class AppTextStyles {
  late ThemeData _themeData;

  AppTextStyles(this._themeData);

  static AppTextStyles of(BuildContext context) {
    return AppTextStyles(Theme.of(context));
  }

  AppTextStyles copyWith({Color? color}) {
    ColorScheme colorScheme = _themeData.colorScheme;
    if (color != null) {
      colorScheme = colorScheme.copyWith(onBackground: color);
    }
    return AppTextStyles(_themeData.copyWith(colorScheme: colorScheme));
  }

  TextStyle get bodyMedium => _themeData.textTheme.bodyMedium!;

  TextStyle get bodySmall => _themeData.textTheme.bodySmall!;

  TextStyle get bodyLarge => _themeData.textTheme.bodyLarge!;

  TextStyle get labelMedium => _themeData.textTheme.labelMedium!;

  TextStyle get labelSmall => _themeData.textTheme.labelSmall!;

  TextStyle get labelLarge => _themeData.textTheme.labelLarge!;

  TextStyle get headlineMedium => _themeData.textTheme.headlineMedium!;

  TextStyle get headlineSmall => _themeData.textTheme.headlineSmall!;

  TextStyle get headlineLarge => _themeData.textTheme.headlineLarge!;

  TextStyle get titleMedium => _themeData.textTheme.titleMedium!;

  TextStyle get titleSmall => _themeData.textTheme.titleSmall!;

  TextStyle get titleLarge => _themeData.textTheme.titleLarge!;

  TextStyle get displayMedium => _themeData.textTheme.displayMedium!;

  TextStyle get displaySmall => _themeData.textTheme.displaySmall!;

  TextStyle get displayLarge => _themeData.textTheme.displayLarge!;
}

/// Converts in a simple way a textStyle to the desired font weight.
///
/// Example usage:
/// `context.textStyles.h1.semiBold`
extension FontWeights on TextStyle {
  /// Black, the most thick
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);

  /// Extra-bold
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// Bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Semi-bold
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Medium
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Normal, regular, plain
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Light
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Extra-light
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Thin, the least thick
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
}

/// Converts in a simple way a textStyle to the desired font style.
///
/// Example usage:
/// `context.textStyles.h1.italic`
extension FontStyles on TextStyle {
  /// Use the upright glyphs
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  /// Use glyphs designed for slanting
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension TextDecorationStyles on TextStyle {
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get none => copyWith(decoration: TextDecoration.none);
}