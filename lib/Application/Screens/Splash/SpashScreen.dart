import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:proto/Application/Style/Palette.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: Container(
       color: AppPalette.BLACK,
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('MY AUTO',
                 style: TextStyle(
                     fontSize: 40,
                     fontWeight: FontWeight.w600,
                     color: AppPalette.WHITE
                 )
             ),
             const SizedBox(
               height: 2,
             ),

             Text('garage',
                 style: TextStyle(
                     fontSize: 10,
                     fontWeight: FontWeight.w200,
                     color: AppPalette.WHITE
                 )
             ),

             const SizedBox(
               height: 200,
             ),

             Text( 'Loading...',
                 style: TextStyle(
                     fontSize: 10,
                     fontWeight: FontWeight.w200,
                     color: AppPalette.WHITE
                 )
             ),
           ],
         ),
       ),
     ),
   );
  }
}

