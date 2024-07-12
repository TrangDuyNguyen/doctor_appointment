//
import 'package:firebase_core/firebase_core.dart';

import '../../features/user/model/user_model.dart';
import 'flavor_config.dart';

class AppConfig {
  final String appName;
  final String apiBaseUrl;
  final String apiKey;
  final String appVersion;
  final FirebaseOptions firebaseOptions;

  String deviceToken = '';
  String defaultCurrencyCode;
  String defaultCountryCode;
  String defaultLanguageCode;
  String defaultThemeMode;
  bool isEnableNotification = false;

  UserModel? _user;

  AppConfig({
    required this.appName,
    required this.apiBaseUrl,
    required this.apiKey,
    required this.firebaseOptions,
    this.appVersion = '1.0.0',
    this.defaultCountryCode = 'US',
    this.defaultLanguageCode = 'en',
    this.defaultThemeMode = 'light',
    this.defaultCurrencyCode = 'USD',
  });

  static AppConfig? _instance;

  static void initialize(
      {required Flavor flavor,
        required Environment environment,
        required FirebaseOptions firebaseOptions}) {
    switch (flavor) {
      case Flavor.debug:
        switch (environment) {
          case Environment.test:
            _instance = AppConfig(
              appName: 'Doctor Appointment (Test)',
              apiBaseUrl: 'https://test.api.myapp.com',
              apiKey: 'test-api-key',
              firebaseOptions: firebaseOptions,
            );
            break;
          case Environment.staging:
            _instance = AppConfig(
              appName: 'Doctor Appointment (Staging)',
              apiBaseUrl: 'https://staging.api.myapp.com',
              apiKey: 'staging-api-key',
              firebaseOptions: firebaseOptions,
            );
            break;
          default:
            throw Exception(
                'Unknown environment: $environment for debug flavor');
        }
        break;
      case Flavor.release:
        _instance = AppConfig(
          appName: 'Doctor Appointment',
          apiBaseUrl: 'https://api.myapp.com',
          apiKey: 'production-api-key',
          firebaseOptions: firebaseOptions,
        );
        break;
    }
  }

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception('AppConfig is not initialized. Call initialize() first.');
    }
    return _instance!;
  }

  // Method to set the user
  void setUser(UserModel user) {
    _user = user;
  }

  // Method to get the user
  UserModel? get user => _user;
}
