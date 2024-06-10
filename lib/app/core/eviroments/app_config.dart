//
// import 'flavor_config.dart';
//
// /// AppConfig is typically used for storing application-wide configuration settings,
// /// such as API keys, default values, and environment settings.
// class AppConfig {
//   final Flavor flavor;
//   final Environment environment;
//   final String appVersion;
//
//   /// Testing flag to clear cache
//   final bool isClearCache;
//   final bool isDebugMode;
//   final bool isPrintNetworkLog = false;
//   final bool isPrintNetworkResponse = false;
//   final bool isPrintNetworkRequest = false;
//   final bool isEnablePerformanceOverlay = false;
//   final bool isEnableDebugBanner = true;
//
//   /// Default value in the app
//   //FirebaseOptions firebaseOptions;
//
//   /// FCM token
//   String deviceToken = '';
//   String defaultCurrencyCode;
//   String defaultCountryCode;
//   String defaultLanguageCode;
//   String defaultThemeMode;
//   bool isEnableNotification = false;
//
//   static late final EnvironmentValues _environmentValues;
//   static late AppConfig _instance;
//
//   AppConfig._({
//     required this.flavor,
//     required this.environment,
//     required this.isDebugMode,
//     //required this.firebaseOptions,
//     this.isClearCache = false,
//     this.appVersion = '1.0.0',
//     this.defaultCountryCode = 'US',
//     this.defaultLanguageCode = 'en',
//     this.defaultThemeMode = 'light',
//     this.defaultCurrencyCode = 'USD',
//   });
//
//   static void initialize({
//     required Flavor flavor,
//     required Environment env,
//     //required FirebaseOptions firebaseOptions,
//   }) {
//     _environmentValues = EnvConfig.getEnvValues(env);
//     _instance = AppConfig._(
//       flavor: flavor,
//       isDebugMode: flavor == Flavor.debug,
//       environment: env,
//       //firebaseOptions: firebaseOptions,
//       appVersion: '1.0.0',
//       defaultCountryCode: 'US',
//       defaultLanguageCode: 'en',
//       defaultThemeMode: 'Light',
//       defaultCurrencyCode: 'USD',
//     );
//   }
//
//   static AppConfig get instance {
//     return _instance;
//   }
//
//   factory AppConfig() {
//     return _instance;
//   }
// }
//
// extension AppConfigExt on AppConfig {
//   String get appName => AppConfig._environmentValues.appName;
//
//   @Deprecated('will be removed in next version')
//   String get apiBaseUrl => AppConfig._environmentValues.apiBaseUrl;
//
//   String get apiBaseUrlV2 => AppConfig._environmentValues.baseUrlV2();
//
//   String get apiKey => AppConfig._environmentValues.apiKey ?? '';
//
//   String get clientId => AppConfig._environmentValues.clientId ?? '';
//
//   String get clientKey => AppConfig._environmentValues.clientKey ?? '';
//
//   String get uciKey => AppConfig._environmentValues.uciKey ?? '';
//
//   String get flightUrl => AppConfig._environmentValues.flightUrl();
//
//   String get websiteUrl => AppConfig._environmentValues.websiteUrl();
// }
