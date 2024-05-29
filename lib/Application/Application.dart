import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proto/Application/Router/GoRouterPathCollector.dart';
import 'package:proto/Application/Router/Router.dart';
import 'package:provider/provider.dart';

import 'Notifiers/SplashScreenNotifier.dart';
import 'Notifiers/ConnectionCheckNotifier.dart';

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  late SplashScreenNotifier _splashScreenNotifier;
  late ConnectionCheckNotifier _connectionCheckNotifier;
  late GoRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _splashScreenNotifier = context.read<SplashScreenNotifier>();

    _appRouter = getRouterConfig();

    Future.delayed(const Duration ( seconds:  1 ), () {
      _splashScreenNotifier.DisableSplashScreen();
    });
  }

  @override
  Widget build ( BuildContext context ) {
    
    final ConnectionCheckNotifier connectionState = Provider.of<ConnectionCheckNotifier>(context);

    if ( connectionState.isConnected == false && (GoRouterPathCollector.GetCurrentPage() != '/no_internet')) {
      _appRouter.go( '/no_internet' );
    }

    if ( connectionState.isConnected == true && (GoRouterPathCollector.GetCurrentPage() == '/no_internet')) {
      if ( GoRouterPathCollector.GetCurrentPage() != null ) {
        _appRouter.go( GoRouterPathCollector.GetPreviousPage() );
      }
      else {
        _appRouter.go( '/' );
      }
    }

    return MaterialApp.router(
        routerConfig: _appRouter,
        debugShowCheckedModeBanner: true,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
    );
  }
}
