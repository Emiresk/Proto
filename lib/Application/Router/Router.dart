
import 'package:go_router/go_router.dart';

import 'package:proto/Application/Providers/SplashScreenProvider.dart';
import 'package:proto/Application/Screens/Splash/SpashScreen.dart';
import 'package:proto/Application/Screens/Start/start_page_screen.dart';
import 'package:proto/Application/Screens/Settings/settings_page_screen.dart';

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
    GoRoute(
        path: '/start',
        builder: (context, state ) => StartPageScreen(),
        name: 'Main page',

    ),

    GoRoute(
        path: '/settings',
        builder: (context, state ) => SettingsPageScreen(),
        name: 'Settings page',

    ),
  ]
);