// enum Flavor { debug, release }
//
// enum Environment { test, aut, live }
//
// class EnvironmentValues {
//   final String appName;
//   final String apiBaseUrl;
//   final Map<String, String> hosts;
//   final Map<String, String>? urls;
//   final String? apiKey;
//   final String? clientId;
//   final String? clientKey;
//   final String? uciKey;
//
//   EnvironmentValues({
//     required this.apiBaseUrl,
//     required this.appName,
//     required this.hosts,
//     this.urls,
//     this.apiKey,
//     this.clientId,
//     this.clientKey,
//     this.uciKey,
//   });
//
//   @override
//   String toString() {
//     return 'FlavorValues{appName: $appName, hosts: $hosts, urls: $urls, apiKey: $apiKey, clientId: $clientId, clientKey: $clientKey, uciKey: $uciKey}';
//   }
// }
//
// class EnvConfig {
//   EnvConfig._();
//
//   static EnvironmentValues getEnvValues(Environment env) {
//     switch (env) {
//       case Environment.test:
//         return _getTestEnvValues();
//       case Environment.aut:
//         return _getStagingEnvValues();
//       default:
//         return _getProEnvValues();
//     }
//   }
//
//   static EnvironmentValues _getTestEnvValues() {
//     // Configuration specific to the test environment
//     return EnvironmentValues(
//       appName: 'Heyotrip Dev',
//       apiBaseUrl: 'https://sb-heyotrip-api.hhllglobal.com/v1.0/api/mobile',
//       hosts: {
//         'baseUrlV2': 'https://sb-heyotrip-api-v2.hhllglobal.com/api',
//       },
//       urls: {
//         'flightUrl': "https://uat-heyotrip-api.hhllglobal.com/v1.0/api/mobile",
//         'websiteUrl': "https://sb-heyotrip.hhllglobal.com"
//       },
//       apiKey: '4Fguozdx7eFzUKtXO1AsBzoe2re8jSGlH7DcOXG0',
//     );
//   }
//
//   static EnvironmentValues _getStagingEnvValues() {
//     // Configuration specific to the staging environment
//     return EnvironmentValues(
//       appName: 'Heyotrip',
//       apiBaseUrl: 'https://sb-heyotrip-api.hhllglobal.com/v1.0/api/mobile',
//       hosts: {
//         'baseUrlV2': 'https://sb-heyotrip-api-v2.hhllglobal.com/api',
//       },
//       urls: {
//         'flightUrl': "https://uat-heyotrip-api.hhllglobal.com/v1.0/api/mobile",
//         'websiteUrl': "https://sb-heyotrip.hhllglobal.com"
//       },
//       apiKey: '4Fguozdx7eFzUKtXO1AsBzoe2re8jSGlH7DcOXG0',
//     );
//   }
//
//   static EnvironmentValues _getProEnvValues() {
//     // Default configuration
//     return EnvironmentValues(
//       appName: 'Heyotrip',
//       apiBaseUrl: 'https://sb-heyotrip-api.hhllglobal.com/v1.0/api/mobile',
//       hosts: {
//         'baseurlV2': 'https://sb-heyotrip-api-v2.hhllglobal.com/api',
//       },
//       urls: {
//         'flightUrl': "https://uat-heyotrip-api.hhllglobal.com/v1.0/api/mobile",
//         'websiteUrl': "https://sb-heyotrip.hhllglobal.com"
//       },
//       apiKey: '4Fguozdx7eFzUKtXO1AsBzoe2re8jSGlH7DcOXG0',
//     );
//   }
// }
//
// extension EnvConfigExt on EnvironmentValues {
//   String baseUrlV2() {
//     return hosts['baseUrlV2']!;
//   }
//
//   String flightUrl() {
//     return urls!['flightUrl']!;
//   }
//
//   String websiteUrl() {
//     return urls!['websiteUrl']!;
//   }
// }
