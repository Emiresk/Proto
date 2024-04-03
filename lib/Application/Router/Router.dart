import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:proto/Application/Providers/SplashScreenProvider.dart';
import 'package:proto/Application/Screens/Splash/SpashScreen.dart';
import 'package:proto/Application/Screens/Start/start_page_screen.dart';


GoRouter CreateAppRouter ( SplashScreenProvider ssProvider ) => GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',

  refreshListenable: ssProvider,

  //observers: '',

  errorBuilder: ( context, state ) {
    if ( ssProvider.showSplashOnStart() ){
      return SplashScreen();
    }

    else {
      return StartPageScreen();
    }
  },

  routes: [

  ]
);