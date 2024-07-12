import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../router/app_routing_mixin.dart';


class AppRoutingCore with AppRoutingMixin {
  final BuildContext context;

  AppRoutingCore({required this.context});

  Future<T?> navSignIn<T extends Object?>({Object? args}) {
    return navPage(
      context,
      page: AppPage.signIn,
      args: args,
    );
  }

  Future<T?> navSignUp<T extends Object?>({Object? args}) {
    return navPage(
      context,
      page: AppPage.signUp,
      args: args,
    );
  }
}

class AppRoutingHook extends Hook<AppRoutingCore> {
  @override
  HookState<AppRoutingCore, Hook<AppRoutingCore>> createState() {
    return _AppRoutingHookState();
  }
}

class _AppRoutingHookState extends HookState<AppRoutingCore, AppRoutingHook> {
  AppRoutingCore? _mAppRouting;

  @override
  AppRoutingCore build(BuildContext context) {
    _mAppRouting = AppRoutingCore(context: useContext());
    return _mAppRouting ?? AppRoutingCore(context: context);
  }

  @override
  void dispose() {
    _mAppRouting = null;
    super.dispose();
  }
}

AppRoutingCore useAppRouting() {
  return use(AppRoutingHook());
}
