import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Virac',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Secure Virac'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title
  }): super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State < MyHomePage > {
  String location;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virac Emergency"),
      ),
      body: bodyData(),
    );
  }

  void sendMessage(String message, List<String> recipient) async {
    String _result = await FlutterSms
      .sendSMS(message: message, recipients: recipient)
      .catchError((onError) {
        print(onError);
      });
    print(_result);
  }

  sendSms() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.brand}');

    Position location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    String message = 'An emergency alert was triggered in ${androidInfo.brand} device. Last known location is at $location';
    debugPrint(message);
    List<String> recipient = ['09985986027', '09183242541']; //Emergency Hotline
    
    sendMessage(message, recipient);
  }

  Widget bodyData() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: < Widget > [
        Ink(
          decoration: ShapeDecoration(
            color: Colors.green[300],
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.blueAccent,
            ),
            iconSize: 150.0,
            splashColor: Colors.red[400],
            padding: EdgeInsets.all(40.0),
            onPressed: () {
              sendSms();
            },
          )),
        Padding(
          padding: EdgeInsets.all(25.0),
        ),
        Text(
          "Long press to send emergency alert",
          textAlign: TextAlign.center,
          style: TextStyle(     
            color: Colors.black,
            fontSize: 20.2,
            fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}