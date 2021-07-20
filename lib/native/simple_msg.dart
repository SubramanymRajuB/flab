import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';


class SimplePlatformMsg extends StatefulWidget {
  SimplePlatformMsg({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SimplePlatformMsgState createState() => new _SimplePlatformMsgState();
}
class _SimplePlatformMsgState extends State<SimplePlatformMsg> {
  static const msgChannel = const MethodChannel('flutter.native/simple_msg');
  static const launchChannel = const MethodChannel('flutter.native/launchURL');
  static const batteryChannel = const MethodChannel('flutter.native/battery');

  String _responseFromNativeCode = 'Waiting for Response...';
  Future<void> _getNativeMsg() async {
    String response = "";
    try {
      final String result = await msgChannel.invokeMethod('simpleMsgFromNative');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }

  Future<void> _launchURL() async {
    try {
       await launchChannel.invokeMethod('launchBrowser');
    } on PlatformException catch (e) {
      var response = "Failed to Invoke: '${e.message}'.";
    }
  }

  // Get battery level.
  String _batteryLevel = 'Waiting for Battery Status...';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await batteryChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        elevation: 0,
        title: Text("Native API Acess Demo", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          ),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Simple Message from Native'),
                onPressed: _getNativeMsg,
              ),
              Text(_responseFromNativeCode),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Launch URL'),
                onPressed: _launchURL,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Get Battery Status'),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}