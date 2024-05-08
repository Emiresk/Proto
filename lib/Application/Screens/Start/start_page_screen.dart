import 'package:easy_localization/easy_localization.dart';
import 'package:proto/lang/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
