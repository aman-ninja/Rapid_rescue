import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapid_rescue/Weather.dart';
class weatherScreen extends StatefulWidget{
  weatherScreen();
  @override
  State<StatefulWidget> createState() => _weatherScreen();
}
class _weatherScreen extends State<weatherScreen> {
  // Position? currentPosition;
  @override
  void initState() async{
    setState(() async{
     var weatherData = await weather().getWeatherData() ;
     print(weatherData);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Text(
          'weather',
        ),
        ),
      ],
    );
  }
}