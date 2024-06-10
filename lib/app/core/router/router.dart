import 'package:doctor_appointment/app/features/auth/view/create_account_screen.dart';
import 'package:doctor_appointment/app/features/auth/view/sign_in_screen.dart';
import 'package:doctor_appointment/app/features/auth/view/splash_screen.dart';
import 'package:doctor_appointment/app/features/auth/view/welcome_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/main/view/main_view.dart';
import 'app_page.dart';
import 'app_routing.dart';

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO: add your router here
      initialLocation: AppPage.splash.getPath,
      routes: routes,
    );
  },
);
