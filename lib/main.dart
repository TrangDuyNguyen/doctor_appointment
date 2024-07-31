import 'package:doctor_appointment/app/core/eviroments/app_config.dart';
import 'package:doctor_appointment/app/core/eviroments/flavor_config.dart';
import 'package:doctor_appointment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/core/local_storage/app_storage.dart';
import 'app/features/user/entity/user_model.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final firebaseOptions = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  AppConfig.initialize(
      flavor: Flavor.debug,
      environment: Environment.test,
      firebaseOptions: firebaseOptions.options);

  // for initializing local storage
  final appStorage = AppStorage();
  await appStorage.initAppStorage();

  UserModel? storedUser = appStorage.getUser();
  if (storedUser != null) {
    AppConfig.instance.setUser(storedUser);
  }

  runApp(
    ProviderScope(
      overrides: [
        appStorageProvider.overrideWithValue(appStorage),
      ],
      child: const App(),
    ),
  );
}
