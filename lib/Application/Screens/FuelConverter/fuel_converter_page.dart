import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proto/Application/Extensions/Widgets/FY_InputFormatter.dart';
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

  final Map<String, Map<String, dynamic>> _fuelDataMap = {
    "us": {
      "code": "us",
      "label": "US MPG",
      "flag": Flag(Flags.united_states_of_america, size: 20,),
    },
    "uk": {
      "code": "uk",
      "label": "UK MPG",
      "flag": Flag(Flags.united_kingdom, size: 20,),
    },
    "eu": {
      "code": "eu",
      "label": "L/100Km",
      "flag": Flag(Flags.european_union, size: 20,),
    },
  };

  final String _mapSelectedKey = 'us';

  double _fuelValue1 = 0;
  double _fuelValue2 = 0;

  String _fuelType1 = '';

  String _fuelType2 = '';

  late String _selectedValue1;
  late String _selectedValue2 = '';

  late Flag _icon1;

  late Flag _icon2;
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  @override
  void initState() {
    super.initState();

    _selectedValue1 = _fuelDataMap.entries.first.value['label'];
    _selectedValue2 = _fuelDataMap.entries.last.value['label'];

    _icon1 = _fuelDataMap.entries.first.value['flag'];
    _icon2 = _fuelDataMap.entries.last.value['flag'];

    print("Value _selectedValue1 = {$_selectedValue1}, _selectedValue2 = {$_selectedValue2}");

    _textController1.addListener((){
      final value = _textController1.text;
      if ( value.isNotEmpty ) {

        print("Listener");

        final mValue = (double.parse(value) ?? 0) * 1.6 / 1.5;
        _textController2.text = mValue.toStringAsFixed(2);
      }
    });

    _textController2.addListener((){
      final value = _textController2.text;
      if ( value.isNotEmpty ) {
        final mValue = (double.parse(value) ?? 0) * 1.5 / 1.6;
        _textController1.text = mValue.toStringAsFixed(2);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _textController1.dispose();
    _textController2.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _dropdownType = _listFuel.first;

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
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only( top: 25, left: 15,right: 15),
              height: 375,
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
              child: Column(
                children: [
                  const SizedBox( height: 15,),
                  const Text ("Fuel eco converter",
                    style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
                  ),
                  const SizedBox( height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container (
                                margin: EdgeInsets.only(left: 5),
                                child: DropdownMenu<String>(
                                  initialSelection: 'us',

                                  leadingIcon: Container(
                                    margin: EdgeInsets.only(left: 10, right: 15),
                                    child: _icon1,
                                  ),

                                  onSelected: ( String? val ){
                                    print( "Value ==> {$val}");

                                    setState(() {
                                      _icon1 = _fuelDataMap[val]?['flag'];
                                    });
                                  },

                                  trailingIcon: Icon(Icons.arrow_downward, size: 16,),
                                  selectedTrailingIcon: Icon(Icons.arrow_upward, size: 16,),

                                  dropdownMenuEntries: _fuelDataMap.keys.map<DropdownMenuEntry<String>>((String val){
                                    return DropdownMenuEntry(
                                        value: _fuelDataMap[val]?['code'],
                                        label: _fuelDataMap[val]?['label'],
                                        leadingIcon: _fuelDataMap[val]?['flag']
                                    );
                                  }).toList(),

                                  width: 220,
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _textController1,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
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
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                onChanged: (fuelValue) {
                                  setState(() {
                                    _fuelValue1 = double.tryParse(fuelValue) ?? 0;
                                  });
                                },
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
                              flex: 4,
                              child: Container (
                                margin: EdgeInsets.only(left: 5),
                                child: DropdownMenu<String>(
                                  initialSelection: 'eu',

                                  leadingIcon: Container(
                                    margin: EdgeInsets.only(left: 10, right: 15),
                                    child: _icon2,
                                  ),

                                  onSelected: ( String? val ){
                                    print( "Value ==> {$val}");

                                    setState(() {
                                      _icon2 = _fuelDataMap[val]?['flag'];
                                    });
                                  },

                                  trailingIcon: Icon(Icons.arrow_downward, size: 16,),
                                  selectedTrailingIcon: Icon(Icons.arrow_upward, size: 16,),

                                  dropdownMenuEntries: _fuelDataMap.keys.map<DropdownMenuEntry<String>>((String val){
                                    return DropdownMenuEntry(
                                        value: _fuelDataMap[val]?['code'],
                                        label: _fuelDataMap[val]?['label'],
                                        leadingIcon: _fuelDataMap[val]?['flag']
                                    );
                                  }).toList(),

                                  width: 220,
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: _textController2,

                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
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
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [FY_InputFormatter()],
                                onChanged: (fuelValue) {
                                  setState(() {
                                    _fuelValue2 = double.tryParse(fuelValue) ?? 0;
                                  });
                                },
                              ),
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
        ),
      ),
    );
  }
}
