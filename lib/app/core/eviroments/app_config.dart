//
import 'package:firebase_core/firebase_core.dart';

import 'flavor_config.dart';

class AppConfig {
  final Flavor flavor;
  final Environment environment;
  final String appVersion;
  final String appName;
  /// Testing flag to clear cache
  final bool isClearCache;
  final bool isDebugMode;

  /// Default value in the app
  FirebaseOptions firebaseOptions;

  /// FCM token
  String deviceToken = '';
  String defaultCurrencyCode;
  String defaultCountryCode;
  String defaultLanguageCode;
  String defaultThemeMode;
  bool isEnableNotification = false;

  static late AppConfig _instance;

  AppConfig._({
    required this.appName,
    required this.flavor,
    required this.environment,
    required this.isDebugMode,
    required this.firebaseOptions,
    this.isClearCache = false,
    this.appVersion = '1.0.0',
    this.defaultCountryCode = 'US',
    this.defaultLanguageCode = 'en',
    this.defaultThemeMode = 'light',
    this.defaultCurrencyCode = 'USD',
  });

  static void initialize({
    required Flavor flavor,
    required Environment env,
    required FirebaseOptions firebaseOptions,
  }) {
    _instance = AppConfig._(
      appName: 'Doctor Appointment',
      flavor: flavor,
      isDebugMode: flavor == Flavor.debug,
      environment: env,
      firebaseOptions: firebaseOptions,
      appVersion: '1.0.0',
      defaultCountryCode: 'US',
      defaultLanguageCode: 'en',
      defaultThemeMode: 'Light',
      defaultCurrencyCode: 'USD',
    );
  }

  static AppConfig get instance {
    return _instance;
  }

  factory AppConfig() {
    return _instance;
  }
}