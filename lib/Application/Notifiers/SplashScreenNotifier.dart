import 'package:flutter/material.dart';


class SplashScreenNotifier extends ChangeNotifier {

  bool _showSplashScreen = true;

  bool get isSplashScreenVisible => _showSplashScreen;

  void DisableSplashScreen() {
    _showSplashScreen = false;

    notifyListeners();
  }
}