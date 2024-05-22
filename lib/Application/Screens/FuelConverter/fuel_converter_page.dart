

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:proto/Application/Style/Palette.dart';

import 'package:proto/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:uicons/uicons.dart';

import '../../Router/GoRouterPathCollector.dart';

class FuelConverterPage extends StatefulWidget {
  const FuelConverterPage({Key? key}) : super(key: key);

  @override
  _FuelConverterPageState createState() => _FuelConverterPageState();
}

class _FuelConverterPageState extends State<FuelConverterPage> {



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _type = '';

  String _dropdownType = '';
  List<String> _listFuel = ["US MPG", "UK MPG", "L/100 Km"];

  @override
  Widget build(BuildContext context) {

    _dropdownType = _listFuel.first;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppPalette.PRIMARY,
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

        body: Stack (
          children: [
            Container (
              height: 150,
              decoration: const BoxDecoration(
                color: AppPalette.PRIMARY,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only( top: 25, left: 15,right: 15),
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppPalette.WHITE,
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

              children: [
                const SizedBox( height: 25,),
                const Text ("Select source value",
                  style: TextStyle(
                  color: AppPalette.PRIMARY,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
                ),
                const SizedBox( height: 35,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _dropdownType,
                        onChanged: (String? newFuelType) => _dropdownType = newFuelType!,
                        items: _listFuel.map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              height: 50, // высота элементов списка
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(value),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                            ),
                          );
                        }).toList(),
                        dropdownColor: Colors.white, // цвет фона выпадающего меню
                        style: TextStyle(color: Colors.black, fontSize: 18), // стиль текста элементов
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black), // иконка раскрытия
                        iconSize: 30, // размер иконки
                      )
                    ),
                    
                    DropdownMenu<String>(
                      initialSelection: _listFuel[0],
                      onSelected: (val) => _type = val!,
                      dropdownMenuEntries: _listFuel.map<DropdownMenuEntry<String>>((String index){
                        return DropdownMenuEntry<String>(
                          value: index,
                          label: '$index'
                        );
                      }).toList(),

                    ),
                    const Text (" TO ",
                      style: TextStyle(
                        color: AppPalette.PRIMARY,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    ),
                    DropdownMenu<String>(
                      initialSelection: _listFuel[0],
                      onSelected: (val) => _type = val!,

                      dropdownMenuEntries: _listFuel.map<DropdownMenuEntry<String>>((String index){
                        return DropdownMenuEntry<String>(
                          value: index,
                          label: '$index'
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
