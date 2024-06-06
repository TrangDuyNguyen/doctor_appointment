import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

mixin AppRoutingMixin {
  Future<T?> navPage<T extends Object?>(
      BuildContext context, {
        required AppPage page,
        Object? args,
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
      }) {
    return context.push(
      page.namePage,
      extra: args,
    );
  }

  void goWelcomeHome<T extends Object?>(
      BuildContext context, {
        Object? extras,
      }) {
    return context.go(AppPage.welcome.getPath, extra: extras);
  }

  void goOnBoard<T extends Object?>(
      BuildContext context, {
        Object? arguments,
      }) {
    return context.go(AppPage.onboard.getPath, extra: arguments);
  }

  void pop<T extends Object?>(BuildContext context, [T? result]) {
    return context.pop(result);
  }
}
