import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapid_rescue/Models/earthquake.dart';
import 'package:rapid_rescue/safe_screen.dart';
import 'package:rapid_rescue/screens/loading.dart';
import 'package:rapid_rescue/screens/safe_screen.dart';
import 'package:rapid_rescue/unsafe_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  EarthQuake? _earthQuake = new EarthQuake(0, 0, 0, new DateTime.now(), Color(0xFFe83030));
  bool _loading = true;
  bool _isSafe = true;
  @override
  void initState() {
    super.initState();
    locatePosition();

  }
  void locatePosition() async {

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    EarthQuake? earthQuake = await _earthQuake?.prominentEarthquake(position.latitude, position.longitude);

    setState(() {
      _currentPosition = position;
      _earthQuake = earthQuake;
      if(_earthQuake==null)print("safe");
      else{
        _isSafe = false;
      }
      _loading = false;
    });
    print(_currentPosition!.longitude);

    print(_currentPosition!.latitude);

  }


  @override
  Widget build(BuildContext context) {
    if(_loading)return LoadingScreen();
    else if(_isSafe)return safe_screen();
    else return unsafe_screen();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("DASHBOARD"),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Container(
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).canvasColor,
    //             ),
    //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //             child: Column(
    //               children: <Widget>[
    //                 Row(
    //                   children: <Widget>[
    //                     Icon(Icons.location_on),
    //                     SizedBox(
    //                       width: 8,
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: <Widget>[
    //                           Text(
    //                             'Location',
    //                             style: Theme.of(context).textTheme.caption,
    //                           ),
    //                           if (_currentPosition != null )
    //                             Text(_currentPosition!.latitude.toString() + "  " + _currentPosition!.longitude.toString() + " " ,
    //                                 style:
    //                                 Theme.of(context).textTheme.bodyText2),
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 8,
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ))
    //       ],
    //     ),
    //   ),
    // );
  }
}
