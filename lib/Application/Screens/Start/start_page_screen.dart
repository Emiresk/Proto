import 'package:easy_localization/easy_localization.dart';
import 'package:proto/Application/Style/Palette.dart';

import 'package:proto/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:uicons/uicons.dart';

class StartPageScreen extends StatefulWidget {
   @override
  _StartPageScreenState createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.go('/settings'),
                icon: Icon(UIcons.regularRounded.settings),
            ),
          ],
          elevation: 1,
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(UIcons.regularRounded.menu_burger),
          ),
        ),

        drawer: Drawer(
          width: 200,
          child: ListView(
            children: [
              ListTile(
                title: const Text(' '), //TODO Need to add translation
                onTap: () => {},
                enabled: false,
                tileColor: AppPalette.GRAY200,
              ),
              ListTile(
                leading: Icon(UIcons.regularRounded.apps_sort),
                title: const Text('Fuel Converter'), //TODO Need to add translation
                onTap: () => context.go('/converter_fuel'),
                splashColor: AppPalette.ORANGE
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            const SizedBox(height: 20,),
            Center(
              child: Text (
                  LocaleKeys.startpage_header.tr() + " " + LocaleKeys.startpage_subheader.tr()
              ),
            ),
            const SizedBox( height: 20,),
            const Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
