enum AppPage {
  splash,
  welcome,
  onboard,
  signIn,
  signUp,
  fillProfile,
}

extension AppPageEx on AppPage {
  static const Map<AppPage, String> _pageNames = {
    AppPage.onboard: 'main',
    AppPage.splash: 'splash',
    AppPage.welcome: 'welcome',
    AppPage.signIn: 'signIn',
    AppPage.signUp: 'signUp',
    AppPage.fillProfile: 'fillProfile',
  };

  static const Map<AppPage, String> _pagePaths = {
    /// Main
    AppPage.onboard: '/main',

    /// Auth
    AppPage.splash: '/splash',
    AppPage.welcome: '/welcome',
    AppPage.signIn: '/signIn',
    AppPage.signUp: '/signUp',
    AppPage.fillProfile: '/fillProfile',

    ///
  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? AppPage.splash.getPath;

  String get getRoute => '/${_pagePaths[this] ?? AppPage.splash.getPath}';
}
