import 'package:flutter/material.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text('No internet...'),
        ),

        body: const Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child:
              Text (
                'No internet connection...'
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Icon( size: 50, Icons.signal_wifi_statusbar_connected_no_internet_4 )
              ],
            ),
            SizedBox(height: 50,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Checking internet connection ...')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
