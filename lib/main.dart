import 'package:flutter/material.dart';

import 'package:proto/Application/Providers/AppStateProvider.dart';
import 'package:proto/Application/Application.dart';


import 'package:proto/langs/codegen_loader.g.dart';

import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization (
      supportedLocales: const [
        Locale('ru'),
        Locale('ua'),
        Locale('en')
      ],
      path: 'assets/langs',
      fallbackLocale: const Locale('ru'),
      assetLoader: const CodegenLoader(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppStateProvider() ),
        ],
        child: Application(),
      ),
  ));


}
