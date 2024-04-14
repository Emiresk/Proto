// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "startpage_header": "Hello",
  "startpage_subheader": "User"
};
static const Map<String,dynamic> ru = {
  "startpage_header": "Привет",
  "startpage_subheader": "Пользователь"
};
static const Map<String,dynamic> ua = {
  "startpage_header": "Привiт",
  "startpage_subheader": "Користувач"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru, "ua": ua};
}
