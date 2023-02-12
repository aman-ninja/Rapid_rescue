import 'package:flutter/material.dart';
import 'package:rapid_rescue/location.dart';
import 'package:rapid_rescue/unsafe_screen.dart';
import 'safe_screen.dart';
import 'location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapid_rescue/dashboard.dart';

void main() {
  runApp(
      MaterialApp(
      title: "App",
      home: MyApp(),
  )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Widget build(BuildContext context) {

    return DashboardScreen();
  }
}
