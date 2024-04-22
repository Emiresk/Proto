
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proto/Application/Notifiers/SplashScreenNotifier.dart';

import 'package:proto/Application/Style/Palette.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

   final screenProvider = Provider.of<SplashScreenNotifier>(context);

   if ( !screenProvider.isSplashScreenVisible ) {
     Future.delayed(Duration.zero, () {
       context.go('/start');
     });
   }

   return Scaffold(
     body: Container(
       color: AppPalette.BLACK,
       child: const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('ELANTRA CLUB',
                 style: TextStyle(
                     fontSize: 32,
                     fontWeight: FontWeight.w600,
                     color: AppPalette.WHITE,

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
                     fontSize: 20,
                     fontWeight: FontWeight.w400,
                     color: AppPalette.WHITE
                 )
             ),


             SizedBox(
               height: 80,
             ),


             CircularProgressIndicator(
               color: AppPalette.WHITE,
               semanticsLabel: 'asdasd',
             ),
           ],
         ),
       ),
     ),
   );
  }
}

