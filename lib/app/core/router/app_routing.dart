import 'package:doctor_appointment/app/features/auth/view/auth_view.dart';
import 'package:doctor_appointment/app/features/auth/view/fill_profile_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view/create_account_screen.dart';
import '../../features/auth/view/sign_in_screen.dart';
import '../../features/auth/view/splash_screen.dart';
import '../../features/auth/view/welcome_screen.dart';
import '../../features/main/view/main_view.dart';
import 'app_page.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: AppPage.authPage.getPath,
    builder: (context, state) => const AuthView(),
  ),
  GoRoute(
    path: AppPage.splash.getPath,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppPage.welcome.getPath,
    builder: (context, state) => const WelcomeScreen(),
  ),
  GoRoute(
    path: AppPage.signIn.getPath,
    builder: (context, state) => SignInScreen(),
  ),
  GoRoute(
    path: AppPage.signUp.getPath,
    builder: (context, state) => const CreateAccountScreen(),
  ),
  GoRoute(
    path: AppPage.fillProfile.getPath,
    builder: (context, state) => FillProfileScreen(),
  ),

  /// for showing onboarding
  GoRoute(
    path: AppPage.onboard.getPath,
    builder: (context, state) => const MainView(),
  ),
];
