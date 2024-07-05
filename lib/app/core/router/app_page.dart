enum AppPage {
  authPage,
  splash,
  welcome,
  onboard,
  signIn,
  signUp,
  fillProfile,
  searchDoctor,
  filterDoctor,
  detailDoctor,
  bookAppointment,
}

extension AppPageEx on AppPage {
  static const Map<AppPage, String> _pageNames = {
    AppPage.authPage: 'authPage',
    AppPage.onboard: 'main',
    AppPage.splash: 'splash',
    AppPage.welcome: 'welcome',
    AppPage.signIn: 'signIn',
    AppPage.signUp: 'signUp',
    AppPage.fillProfile: 'fillProfile',
    AppPage.searchDoctor: 'searchDoctor',
    AppPage.filterDoctor: 'filterDoctor',
    AppPage.detailDoctor: 'detailDoctor',
    AppPage.bookAppointment: 'bookAppointment',
  };

  static const Map<AppPage, String> _pagePaths = {
    /// Main
    AppPage.onboard: '/main',

    /// Auth
    AppPage.authPage: '/authPage',
    AppPage.splash: '/splash',
    AppPage.welcome: '/welcome',
    AppPage.signIn: '/signIn',
    AppPage.signUp: '/signUp',
    AppPage.fillProfile: '/fillProfile',

    ///
    /// doctor
    AppPage.searchDoctor: '/searchDoctor',
    AppPage.filterDoctor: '/filterDoctor',
    AppPage.detailDoctor: '/detailDoctor',
    AppPage.bookAppointment: '/bookAppointment',
  };

  String get namePage => _pageNames[this] ?? '';

  String get getPath => _pagePaths[this] ?? AppPage.splash.getPath;

  String get getRoute => '/${_pagePaths[this] ?? AppPage.splash.getPath}';
}
