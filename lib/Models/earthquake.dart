import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:rapid_rescue/Models/earthquake.dart';
import  'package:http/http.dart' as http;
import 'package:haversine_distance/haversine_distance.dart';

class EarthQuake{
  double? latitude;
  double? longitude;
  double? magnitude;
  // double? radius;
  DateTime? dateTime;
  Color? alertColor;


  EarthQuake(
      this.latitude,
      this.longitude,
      this.magnitude,
      this.dateTime,
      this.alertColor
      );

  factory EarthQuake.fromJSon(Map<String,dynamic> map){
    double? magnitude = map["properties"]["mag"].toDouble();
    double? latitude = map["geometry"]["coordinates"][1].toDouble();
    double? longitude = map["geometry"]["coordinates"][0].toDouble();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(map["properties"]["time"]);
    Color? alertColor;
    if(magnitude!<6)alertColor = Color(0xFFcae342);
    else if(magnitude>6 && magnitude<8)alertColor = Color(0xFFe89430);
    else alertColor = Color(0xFFe83030);
    return EarthQuake(
        latitude,
        longitude,
        magnitude,
        dateTime,
        alertColor
    );
  }

  Future<EarthQuake?> prominentEarthquake(double? latitude, double? longitude)async{
    http.Response response = await http.get(Uri.parse('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson'));
    Map data = jsonDecode(response.body);
    int count = data['metadata']['count'];
    if(count==0) return null;
    // List<EarthQuake> earthquakesList = [];
    // SplayTreeMap<double,EarthQuake> ordered = new SplayTreeMap((a,b)=>a.compareTo(b));
    for(int i = 0;i<count;i++){
      EarthQuake earthQuake = EarthQuake.fromJSon(data['features'][i]);
      double distance =  HaversineDistance().haversine(new Location(latitude!, longitude!), new Location(earthQuake.latitude!, earthQuake.longitude!), Unit.KM);
      double radius = exp(earthQuake.magnitude!/1.01-0.13);
      // double radius = 1000;
      if(distance<radius)return earthQuake;
    }
    return null;
  }


}
