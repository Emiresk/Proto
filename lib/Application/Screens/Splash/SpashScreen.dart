import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:proto/Application/Style/Palette.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: Container(
       color: AppPalette.BLACK,
       child: const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('ELANTRA CLUB',
                 style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.w600,
                     color: AppPalette.WHITE
                 )
             ),
             SizedBox(
               height: 1,
             ),

             Text('',
                 style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w200,
                     color: AppPalette.WHITE
                 )
             ),

             SizedBox(
               height: 300,
             ),

             Text( 'Loading...',
                 style: TextStyle(
                     fontSize: 15,
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

