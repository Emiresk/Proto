import 'package:go_router/go_router.dart';
import 'package:proto/Application/Notifiers/ConnectionCheckNotifier.dart';

import 'package:proto/Application/Screens/Start/start_page_screen.dart';
import 'package:proto/Application/Screens/Settings/settings_page_screen.dart';
import 'package:proto/Application/Screens/Splash/splash_screen_page.dart';

import 'package:proto/Application/Screens/NoInternetConnection/no_internet_connection.dart';


GoRouter CreateAppRouter ( ConnectionCheckNotifier _ccn ) {

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',

    redirect: (context, state) {
      if ( !_ccn.isConnected && state.uri.toString() != '/no_internet' ){
        return '/no_internet';
      }

      else if ( _ccn.isConnected && state.uri.toString() == '/no-internet') {
        return '/';
      }

      return null;
    },

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

        GoRoute(
          path: '/no_internet',
          builder: (context, state ) => NoInternetConnection(),
          name: 'Internet connetion has been lost',
        ),
      ],
  );
}
