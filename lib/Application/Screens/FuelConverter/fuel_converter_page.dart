import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proto/Application/Screens/FuelConverter/fuel_consumption_calculator.dart';
import 'package:proto/langs/locale_keys.g.dart';
import 'package:uicons/uicons.dart';
import '../../Router/GoRouterPathCollector.dart';

class FuelConverterPage extends StatefulWidget {
  const FuelConverterPage({Key? key}) : super(key: key);
  @override
  _FuelConverterPageState createState() => _FuelConverterPageState();
}

enum TextFieldSelected {nil, US, UK, EU, EUMIX}

class _FuelConverterPageState extends State<FuelConverterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _usMpgController = TextEditingController();
  final TextEditingController _ukMpgController = TextEditingController();
  final TextEditingController _l100kmController = TextEditingController();
  final TextEditingController _kmLController = TextEditingController();

  TextFieldSelected _selected = TextFieldSelected.nil;
  final FuelConsumptionCalculator _converter = FuelConsumptionCalculator();


  @override
  void initState() {
    super.initState();

    _usMpgController.addListener( (){

      dynamic value = double.tryParse( _usMpgController.text );

      if ( _selected != TextFieldSelected.nil && _selected == TextFieldSelected.US ){
        _ukMpgController.text = _converter.fromUsToUk(value);
        _l100kmController.text = _converter.fromUsToEuMix(value);
        _kmLController.text = _converter.fromUsToKmL(value);
      }
    });

    _ukMpgController.addListener( (){

      dynamic value = double.tryParse( _ukMpgController.text );

      if ( _selected != TextFieldSelected.nil && _selected == TextFieldSelected.UK ){
        _usMpgController.text = _converter.fromUkToUs(value);
        _l100kmController.text = _converter.fromUkToEuMix(value);
        _kmLController.text = _converter.fromUkToKmL(value);
      }
    });

    _l100kmController.addListener( (){

      dynamic value = double.tryParse( _l100kmController.text );

      if ( _selected != TextFieldSelected.nil && _selected == TextFieldSelected.EU ){
        _ukMpgController.text = _converter.fromUkToEuMix(value);
        _usMpgController.text = _converter.fromUsToEuMix(value);
        _kmLController.text = _converter.fromEuToKmL(value);
      }
    });


    _kmLController.addListener( () {
      dynamic value = double.tryParse( _kmLController.text );

      if ( _selected != TextFieldSelected.nil && _selected == TextFieldSelected.EUMIX ){
        _usMpgController.text = _converter.fromUkToUs(value);
        _ukMpgController.text = _converter.fromUsToUk(value);
        _l100kmController.text = _converter.fromUkToEuMix(value);
      }

    });
  }




  @override
  void dispose() {
    _usMpgController.dispose();
    _ukMpgController.dispose();
    _l100kmController.dispose();
    _kmLController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              onPressed: () => context.go('/settings'),
              icon: Icon(UIcons.regularRounded.settings),
              color: Colors.white,
            ),
          ],
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(UIcons.regularRounded.menu_burger),
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(UIcons.regularRounded.arrow_left),
                title: Text(LocaleKeys.fuel_converter_back_button.tr()),
                onTap: () => context.go (GoRouterPathCollector.GetPreviousPage() ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container (
              height: 180,
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45)
                  )
              ),
            ),
            Container (
              height: 70,
              alignment: Alignment.center,
              child: AutoSizeText(
                  LocaleKeys.fuel_converter_page_header.tr(),
textAlign: TextAlign.center,
                  minFontSize: 13,
                  maxFontSize: 26,
                  maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w600)
              ),
            ),
            Container(
              margin: const EdgeInsets.only( top: 85, left: 15,right: 15),
              height: 285,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [ BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 5),
                    spreadRadius: -5
                )],
              ),
              child: Column (
                children: [
                  const SizedBox( height: 25,),
                  Padding(
                      padding: EdgeInsets.only(left: 5, right: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Flag(Flags.united_states_of_america)
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('US MPG')
                              ),
                              Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _usMpgController,
                                    keyboardType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      suffixText: "MPG",
                                      suffixStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onTap: () => _selected = TextFieldSelected.US,
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Flag(Flags.united_kingdom)
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('UK MPG')
                              ),
                              Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _ukMpgController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      suffixText: "MPG",
                                      suffixStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onTap: () => _selected = TextFieldSelected.UK,
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Flag(Flags.european_union)
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('L/100km')
                              ),
                              Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _l100kmController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      suffixText: "Litres",
                                      suffixStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onTap: () {
                                      _selected = TextFieldSelected.EU;
                                          print( "===> {$_selected}");
                                      },
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Flag(Flags.european_union)
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('Km/L')
                              ),
                              Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: _kmLController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                      suffixText: "Km/1L",
                                      suffixStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onTap: () => _selected = TextFieldSelected.EUMIX,

                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}


/*
*
* Widget buildTextField({
  required TextEditingController controller,
  required String suffixText,
  required VoidCallback onTap,
  required TextFieldSelected selected,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
    ),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      suffixText: suffixText,
      suffixStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    onTap: onTap,
  );
}

*
*
*
*
Column(
  children: [
    buildTextField(
      controller: _usMpgController,
      suffixText: "MPG",
      onTap: () {
        _selected = TextFieldSelected.US;
      },
      selected: _selected,
    ),
    SizedBox(height: 15),
    buildTextField(
      controller: _ukMpgController,
      suffixText: "MPG",
      onTap: () {
        _selected = TextFieldSelected.UK;
      },
      selected: _selected,
    ),
    SizedBox(height: 15),
    buildTextField(
      controller: _l100kmController,
      suffixText: "L/100km",
      onTap: () {
        _selected = TextFieldSelected.L100KM;
      },
      selected: _selected,
    ),
    SizedBox(height: 15),
    buildTextField(
      controller: _kmLController,
      suffixText: "Km/L",
      onTap: () {
        _selected = TextFieldSelected.KML;
      },
      selected: _selected,
    ),
  ],
),

*
*
*
* */