import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheckNotifier extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;


  ConnectionCheckNotifier() {
    Connectivity().onConnectivityChanged.listen((event) {
      bool wasConnected = _isConnected;

      _isConnected = (event != ConnectivityResult.none);

      if ( wasConnected != _isConnected ) {
        print("Connetion state changes");

        notifyListeners();
      }
    });
  }
}