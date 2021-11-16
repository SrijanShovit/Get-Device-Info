import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //making object
  DeviceInfoPlugin device_info = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          //getting info from device is async operation
          //so use future builder
          FutureBuilder<AndroidDeviceInfo>(
              future: device_info.androidInfo, //since i'm in android platform

              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  AndroidDeviceInfo info = snapshot.data;
                  return Container(
                      child: Column(
                    children: [
                      Text(
                        "${info.androidId}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text("${info.brand}"),
                      Text("${info.device}"),
                      Text("${info.model}"),
                      Text("${info.manufacturer}"),
                      Text("${info.isPhysicalDevice}"),
                      Text("${info.id}"),
                      Text("${info.host}"),
                      Text("${info.version.baseOS}"),
                      Text("${info.version.codename}"),
                      Text("${info.version.sdkInt}"),
                      Text("${info.fingerprint}"),
                    ],
                  ));
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
