import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:proto/lang/locale_keys.g.dart';

class StartPageScreen extends StatefulWidget {
   @override
  EStartPageScreenState createState() => EStartPageScreenState();
}

class EStartPageScreenState extends State<StartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()=>{} , icon: const Icon( Icons.icecream ) ),
            const SizedBox( height: 10.0 ),
          ],
        ),

        body: Column(
          children: [
            Center(
              child: Text (LocaleKeys.startpage_header.tr() + " " + LocaleKeys.startpage_subheader.tr()),
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
          ],
        ),
      ),
    );
  }
}
