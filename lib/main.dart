import 'package:flutter/material.dart';
import 'package:proto/Application/Config/LocalizationConfig.dart';

import 'package:proto/Application/Notifiers/SplashScreenNotifier.dart';

import 'package:proto/Application/Application.dart';


import 'package:proto/lang/codegen_loader.g.dart';

import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization (

      supportedLocales: LocalizationConfig.instance.GetSupportedLocales,
      path: LocalizationConfig.instance.GetLocalesPath,
      fallbackLocale: LocalizationConfig.instance.GetFallBackLocale,
      assetLoader: LocalizationConfig.instance.GetAssetLoader,
      saveLocale: LocalizationConfig.instance.SaveLocale,

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashScreenNotifier() ),
        ],
        child: Application(),
      ),
  ));


}
