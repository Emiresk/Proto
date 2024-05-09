import 'package:go_router/go_router.dart';
import 'package:proto/Application/Router/GoRouterObserver.dart';

import 'package:proto/Application/Screens/NoInternetConnection/no_internet_connection.dart';
import 'package:proto/Application/Screens/Settings/settings_page_screen.dart';
import 'package:proto/Application/Screens/Splash/splash_screen_page.dart';
import 'package:proto/Application/Screens/Start/start_page_screen.dart';
import 'package:proto/Application/Screens/FuelConverter/fuel_converter_page.dart';

GoRouter getRouterConfig () {

  const String baseUrl = '/splash';

  const bool debugModeEnable = true;

  final List<RouteBase> routes = [
    GoRoute(
      path: '/splash',
      builder: (context, state ) => SplashScreen(),
    ),

    GoRoute(
      path: '/',
      builder: (context, state ) => StartPageScreen(),
    ),

    GoRoute(
      path: '/start',
      builder: (context, state ) => StartPageScreen(),
    ),

    GoRoute(
      path: '/converter_fuel',
      builder: (context, state ) => FuelConverterPage(),
    ),
    
    GoRoute(
      path: '/settings',
      builder: (context, state ) => SettingsPageScreen(),
    ),

    GoRoute(
      path: '/no_internet',
      builder: (context, state ) => NoInternetConnection(),
    ),
  ];

  return GoRouter(
    debugLogDiagnostics: debugModeEnable,
    initialLocation: baseUrl,
    routes: routes,
    observers: [
      GoRouterObserver()
    ]
  );
}


