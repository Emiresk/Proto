import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:proto/lang/locale_keys.g.dart';
import 'package:uicons/uicons.dart';

class StartPageScreen extends StatefulWidget {
   @override
  _StartPageScreenState createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.go('/settings'),
                icon: Icon(UIcons.regularRounded.settings),
            ),
          ],
          elevation: 1,
        ),

        body: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child:
              Text (
                  LocaleKeys.startpage_header.tr() + " " + LocaleKeys.startpage_subheader.tr()
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ElevatedButton(
                  onPressed: () => context.setLocale( Locale('ru')),
                  child: const Text('RU'),
                ),

                ElevatedButton(
                  onPressed: () => context.setLocale( Locale('en')),
                  child: const Text('EN'),
                ),

                ElevatedButton(
                  onPressed: () => context.setLocale( Locale('uk')),
                  child: const Text('UK'),
                ),

                ElevatedButton(
                  onPressed: () => context.setLocale( Locale('es')),
                  child: const Text('ES'),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Debug')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
