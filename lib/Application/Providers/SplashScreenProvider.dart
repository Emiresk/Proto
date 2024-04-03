import 'package:flutter/material.dart';


class SplashScreenProvider extends ChangeNotifier {

  SplashScreenProvider._privateConstructor();

  static SplashScreenProvider? _splashScreenProviderInstance;

  static SplashScreenProvider get instance =>
      _splashScreenProviderInstance ??
      SplashScreenProvider._privateConstructor();

  bool _showSplashOnStart = true;

  bool showSplashOnStart () => _showSplashOnStart;

  void StopShowSplash () {
    _showSplashOnStart = false;

    notifyListeners();
  }
}