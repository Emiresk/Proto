import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:proto/Application/Config/LocalizationConfig.dart';
import 'package:proto/Application/Router/GoRouterPathCollector.dart';

import 'package:uicons/uicons.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({Key? key}) : super(key: key);

  @override
  _SettingsPageScreenState createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  String _selectedLocale = '';

  List<String> _listLocales = [];

  @override
  Widget build(BuildContext context) {

    if ( _listLocales.length == 0 ) {
      _listLocales = LocalizationConfig.instance.GetSupportedLocales
          .map((locale) => locale.toString().split('_').first).toList();

      _selectedLocale = _listLocales.first;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: IconButton(
              icon: Icon(UIcons.regularRounded.arrow_left),
              tooltip: "", //TODO: Добавить ключ
              onPressed: () => context.go (GoRouterPathCollector.GetPreviousPage() ),
          ),
          
/*
          actions: [
            IconButton(
              icon: Icon(
                UIcons.regularRounded.user,
              ),
              tooltip: "", //TODO: Добавить ключ
              onPressed: () => context.go( '/userprofile'),
            ),
          ],
*/
        ),

        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all( 15.0 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('Localization'), //TODO: Добавить ключ
                  SizedBox(width: 50,),

                  DropdownMenu<String>(
                    leadingIcon: const Icon(Icons.search),
                    width: 200,
                    initialSelection: _selectedLocale,
                    onSelected: (value) => setState(() {
                      _selectedLocale = value!;

                      context.setLocale( Locale(_selectedLocale ) );
                    }),

                    dropdownMenuEntries: _listLocales.map<DropdownMenuEntry<String>>((String locale){
                      return DropdownMenuEntry<String>(
                          value: locale,
                          label: 'setting_lang.$locale.$toString()'.tr()
                      );
                    }).toList(),
                  )
                ],
              ),
              Row(
                children: [
                  Text(_selectedLocale)
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
