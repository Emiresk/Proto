import 'package:flutter/material.dart';

class StartPageScreen extends StatefulWidget {
   @override
  EStartPageScreenState createState() => EStartPageScreenState();
}

class EStartPageScreenState extends State<StartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()=>{} , icon: const Icon( Icons.icecream ) ),
            const SizedBox( height: 10.0 ),
          ],
        ),
        drawer: const Drawer(),
        body: const Column(
          children: [
            Center(
              child: Text ("Hi"),
            )
          ],
        ),
      ),
    );
  }
}
