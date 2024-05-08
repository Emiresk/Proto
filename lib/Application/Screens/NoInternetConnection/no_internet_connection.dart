import 'package:flutter/material.dart';

import 'package:proto/Application/Style/Palette.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50,),
            Center(
              child: Text (
                'Something went wrong...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon( size: 120, Icons.signal_wifi_statusbar_connected_no_internet_4 )
              ],
            ),

            SizedBox(height: 50,),

            Text('Internet connection has been lost',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
              ),
            ),

            SizedBox(height: 50,),

            CircularProgressIndicator(
              color: AppPalette.BLACK,
              backgroundColor: AppPalette.GRAY300,
            ),
            SizedBox(height: 10,),

            Text (
              'Tryint to reconnect...',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400
              ),
            ),



          ],
        ),
      ),
    );
  }
}
