import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:proto/Application/Style/Palette.dart';

import 'package:proto/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:uicons/uicons.dart';

import '../../Router/GoRouterPathCollector.dart';

import 'package:radio_group_v2/radio_group_v2.dart';

class FuelConverterPage extends StatefulWidget {
  const FuelConverterPage({Key? key}) : super(key: key);

  @override
  _FuelConverterPageState createState() => _FuelConverterPageState();
}

class _FuelConverterPageState extends State<FuelConverterPage> {



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _type = '';

  List<String> _listFuel = ["US MPG", "UK MPG", "L/100 Km"];

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
          child: ListView(
            children: [
              ListTile(
                leading: Icon(UIcons.regularRounded.arrow_left),
                title: Text('Return back'),
                onTap: () => context.go (GoRouterPathCollector.GetPreviousPage() ),
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            const SizedBox(height: 20,),
            const Center(
              child: Text (
                "Fuel Converter",
                  style: TextStyle(
                      color: AppPalette.PRIMARY,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox( height: 20,),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppPalette.SECONDARY_CONTAINER,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [ BoxShadow(
                  color: AppPalette.SHADOW,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 5),
                  spreadRadius: -5
                )],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  const Text (
                    "Select source value",
                    style: TextStyle(
                        color: AppPalette.PRIMARY,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox( height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownMenu<String>(
                        initialSelection: _listFuel[0],
                        onSelected: (val) => setState(() {
                          _type = val!;
                        }),

                        dropdownMenuEntries: _listFuel.map<DropdownMenuEntry<String>>((String index){
                          return DropdownMenuEntry<String>(
                              value: index,
                              label: '$index'
                          );
                        }).toList(),

                      ),
                      const Text (
                        " TO ",
                        style: TextStyle(
                            color: AppPalette.PRIMARY,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      DropdownMenu<String>(
                        initialSelection: _listFuel[0],
                        onSelected: (val) => setState(() {
                          _type = val!;
                        }),

                        dropdownMenuEntries: _listFuel.map<DropdownMenuEntry<String>>((String index){
                          return DropdownMenuEntry<String>(
                              value: index,
                              label: '$index'
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox( height: 30,),
                  Container(
                      height: 200,
                      child: Text("---"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
