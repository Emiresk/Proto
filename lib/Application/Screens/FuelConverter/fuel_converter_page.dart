

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
              height: 375,
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
                  const SizedBox( height: 15,),

                  const Text ("Fuel eco converter",
                    style: TextStyle(
                    color: AppPalette.PRIMARY,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
                  ),

                  const SizedBox( height: 15,),

                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('From', style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
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
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: Divider(  color: Colors.black, thickness: 1, ),
                            ),
                            Container(
                              color: Colors.white, // Цвет фона иконки, чтобы перекрыть разделитель
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  UIcons.boldRounded.sort_alt,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
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
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox( height: 15,),

                  Text('Result: '),
                  /*
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text('Base fuel type'),
                        SizedBox(height: 20,),
                        Row (
                          children: [
                            Container(
                              child: DropdownButtonHideUnderline(
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
                              color: Colors.blueGrey,
                            ),
                            Container(

                              child: DropdownButtonHideUnderline(
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
                              color: Colors.blue,
                            ),


                          ],
                        ),



                      ],
                    ),

                  ),
                  */


                ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
