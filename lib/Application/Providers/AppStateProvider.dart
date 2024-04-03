import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {

  AppStateProvider._privateConstructor();
  static AppStateProvider _instance = AppStateProvider._privateConstructor();

  factory AppStateProvider () {
    return _instance;
  }

  static void reset() => _instance = AppStateProvider._privateConstructor();

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }
}