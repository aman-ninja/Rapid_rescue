import 'package:flutter/material.dart';
import 'package:rapid_rescue/location.dart';
import 'package:rapid_rescue/unsafe_screen.dart';
import 'safe_screen.dart';
import 'location.dart';
void main() {
  runApp(
      MaterialApp(
      title: "App",
      home: MyApp(),
  )
  );
}
class MyApp extends StatelessWidget {
  Future<dynamic> getWeatherData() async{
    location locate = new location();
    await locate.getCurrentLocation();
    print(locate.longitude + locate.longitude);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  getWeatherData();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const safe_screen()),
                  );
                }, child: null,
            ),
          )
        ),
    );
  }
}
