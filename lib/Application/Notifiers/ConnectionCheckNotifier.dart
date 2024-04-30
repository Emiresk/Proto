import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheckNotifier extends ChangeNotifier {
  late bool _isConnected = true;

  bool get isConnected => _isConnected;

  List<ConnectivityResult> availableType = [
    ConnectivityResult.wifi,
    ConnectivityResult.mobile,
  ];

  ConnectionCheckNotifier() {
    print( "[INIT] Init ConnectionCheckNotifier");

    Connectivity().onConnectivityChanged.listen((connectionResult) {
      print( "[INFO] Change state of ConnectionCheckNotifier to $connectionResult");

      if ( availableType.contains( connectionResult.first ) == true ) {
        print( "[INFO] Connection is found");
        changeState ( true );
      }

      else {
        print( "[INFO] Connection has been lost");
        changeState ( false );
      }
    });
  }

  void changeState ( bool isConnected ) {
    _isConnected = isConnected;

    notifyListeners();
  }
}