import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:proto/Application/Providers/SplashScreenProvider.dart';
import 'package:proto/Application/Router/Router.dart';

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _App();
}

class _App extends State<Application> {
  late SplashScreenProvider _screenProvider;

  late GoRouter _goRouter;

  @override
  void initState() {
    super.initState();

    _screenProvider = SplashScreenProvider.instance;
    
    _goRouter = CreateAppRouter( _screenProvider );
    
    Future.delayed(
        Duration ( seconds: 2 ),
        () => _screenProvider.StopShowSplash(),
    );
  }

  @override
  Widget build ( BuildContext context ) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      debugShowCheckedModeBanner: true,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
