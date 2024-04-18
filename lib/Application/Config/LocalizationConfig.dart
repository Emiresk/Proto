import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:proto/lang/codegen_loader.g.dart';

class LocalizationConfig {

  late Locale _currentLocale;

  Locale get GetCurrentLocale => _currentLocale;
  void set SetCurrentLocale (Locale loc ) => _currentLocale = loc;


  LocalizationConfig._privateConstructor();

  final List<Locale> _supportedLocales = const [
    Locale ('en'),
    Locale('ru'),
    Locale('uk'),
    Locale('es'),
  ];

  List<Locale> get GetSupportedLocales => _supportedLocales;

  final String _localesPath =  'assets/langs';
  String get GetLocalesPath => _localesPath;

  final Locale _fallBackLocale = Locale('ru');
  Locale get GetFallBackLocale => _fallBackLocale;

  final AssetLoader _assetLoader = CodegenLoader();
  AssetLoader get GetAssetLoader => _assetLoader;

  final bool _saveLocale = true;
  bool get SaveLocale => _saveLocale;

  static LocalizationConfig? _localizationConfigInstance;

  static LocalizationConfig get instance =>
      _localizationConfigInstance ??
          LocalizationConfig._privateConstructor();



}