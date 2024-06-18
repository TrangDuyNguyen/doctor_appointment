import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:doctor_appointment/app/features/auth/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../main/view/main_view.dart';
import '../enum/auth_status.dart';

import '../providers/auth_providers.dart';

class AuthView extends ConsumerWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
    });

    switch (authState.status) {
      case AuthStatus.uninitialized:
      case AuthStatus.authenticating:
      case AuthStatus.unauthenticated:
        return const WelcomeScreen();
      case AuthStatus.authenticated:
        return const MainView();
      default:
        return const SizedBox();
    }
  }
}
