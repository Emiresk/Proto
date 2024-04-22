import 'package:go_router/go_router.dart';

import 'package:proto/Application/Screens/Start/start_page_screen.dart';
import 'package:proto/Application/Screens/Settings/settings_page_screen.dart';
import 'package:proto/Application/Screens/Splash/splash_screen_page.dart';


GoRouter CreateAppRouter () => GoRouter(

  debugLogDiagnostics: true,

  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state ) => StartPageScreen(),
      name: 'Main page ',
    ),


    GoRoute(
      path: '/splash',
      builder: (context, state ) => SplashScreen(),
      name: 'Splash screen page',
    ),

    GoRoute(
        path: '/start',
        builder: (context, state ) => StartPageScreen(),
        name: 'Start page',
    ),

    GoRoute(
        path: '/settings',
        builder: (context, state ) => SettingsPageScreen(),
        name: 'Settings page',
    ),
  ]
);