import 'package:flutter/material.dart';
import 'package:rapid_rescue/Models/earthquake.dart';
import 'package:rapid_rescue/screens/contact.dart';

import 'Weather.dart';

class unsafe_screen extends StatefulWidget {
  final EarthQuake? earthQuake;
  const unsafe_screen({super.key,required this.earthQuake});
  @override
  State<StatefulWidget> createState()=> _unsafe_screen();

}
class _unsafe_screen extends State<unsafe_screen> {
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    // while(true) _updateSize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50.0,90.0,40.0,10.0),
                      child: Scaffold(
                        body: Text(
                          'Emergency help needed?',
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
                  // color: Colors.white,
                  // margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/image 1.png'),
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.dstATop),
                    ),
                      color: Colors.red,
                      shape: BoxShape.circle
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
                    child: Text(
                      'EarthQuake',
                      style: TextStyle(
                          fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              //       child: Text(
              //         widget.earthQuake!.magnitude.toString(),
              //         style: TextStyle(
              //           fontSize: 20.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 60.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactScreen()));
                          },
                          child: Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
      ),
    );
  }
}

