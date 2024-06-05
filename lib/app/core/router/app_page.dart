enum AppPage {
  splash,
  onboard,
  signIn,
  signUp,
}

extension AppPageEx on AppPage {
  static const Map<AppPage, String> _pageNames = {
    AppPage.onboard: 'main',
    AppPage.splash: 'splash',
  };

  static const Map<AppPage, String> _pagePaths = {
    /// Main
    AppPage.onboard: '/main',
    /// Auth
    AppPage.splash: '/splash'
    ///

  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? AppPage.splash.getPath;

  String get getRoute => '/${_pagePaths[this] ?? AppPage.splash.getPath}';
}