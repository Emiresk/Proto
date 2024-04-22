import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:proto/Application/Notifiers/SplashScreenNotifier.dart';


import 'package:proto/Application/Router/Router.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  late SplashScreenNotifier _splashScreenNotifier;

  late GoRouter _goRouter;

  @override
  void initState() {
    super.initState();
    
    _goRouter = CreateAppRouter();

    final _splashScreenNotifier = context.read<SplashScreenNotifier>();

    Future.delayed(Duration ( seconds:  5 ), () {
      _splashScreenNotifier.DisableSplashScreen();
    });
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
