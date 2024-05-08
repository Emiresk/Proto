
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proto/Application/Router/GoRouterPathCollector.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush( Route route, Route? previousRoute ){
    String? previous = previousRoute?.settings.name ?? '/start';
    String? nextpath = route.settings.name ?? '/start';

    UpdatePaths( previous, nextpath );
  }

  @override
  void didPop( Route route, Route? previousRoute){
    String? previous = previousRoute?.settings.name ?? '/start';
    String? nextpath = route.settings.name ?? '/start';

    UpdatePaths( previous, nextpath );
  }

  void UpdatePaths( String back, String next ){
    GoRouterPathCollector.SetPreviousPage( back );
    GoRouterPathCollector.SetCurrentPage( next );
  }


}
