import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapid_rescue/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rapid_rescue/Weather.dart';
import 'package:rapid_rescue/dashboard.dart';
import 'Weather.dart';

class safe_screen extends StatefulWidget {
  Position? position;
  safe_screen({required this.position});
  @override
  State<StatefulWidget> createState()=> _safe_screen(position: position);
}
class _safe_screen extends State<safe_screen> {
  Position? position;
  _safe_screen({this.position});
  @override
  void initState(){
    print(position!.latitude);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcce8c0),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(95.0,90.0,40.0,10.0),
                child: Scaffold(
                  backgroundColor: Color(0xFFcce8c0),
                  body: Text(
                    "You're safe",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                        fontSize: 40.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Color(0xFFcce8c0),
              // margin: EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image2.png'),
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                        Colors.lightGreenAccent,BlendMode.darken),
                  ),
                  color: Color(0xFFcce8c0),
                  shape: BoxShape.circle
              ),
            ),
          ),
          Container(
            // height: 20.0,
            child: null,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 60.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async{
                        setState(() {
                          // double? lat = position!.latitude;
                          // double? lon = position!.longitude;
                        });
                        // List<String> numbers = await getStringValuesSF();
                        // if(numbers!=null && !numbers.isEmpty){
                          await sendSMS(message: "I felt tremors, my location is "+"{"+position!.latitude.toString()+" , "+position!.longitude.toString()+ "} . Please respond to the situation ASAP.", recipients: ['112','108','+919711077372']);
                        // }
                      },
                      child: Text(
                        'Felt Tremors?',
                        style: TextStyle(
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                color: Color(0xFFcce8c0),
                child: GestureDetector(
                    // child: Text(
                    //     'Get weather info'
                    // ),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const weather()),
                      );
                    }
                )
            ),
          )
        ],
      ),
    );
  }
}

