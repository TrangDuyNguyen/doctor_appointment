import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case AuthStatus.unauthenticated:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.push(AppPage.welcome.getPath);
        });
        return const Scaffold(
          body: Center(
            child: Text('Please log in'),
          ),
        );
      case AuthStatus.authenticated:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.push(AppPage.onboard.getPath);
        });
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
