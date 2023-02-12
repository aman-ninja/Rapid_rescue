import 'package:flutter/material.dart';

class weather extends StatefulWidget{
  const weather();
  @override
  State<StatefulWidget> createState() => _weather();
}
class _weather extends State<weather>{
  _weather();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Expanded(child: FlatButton(
          onPressed: (){

          },
          color: Colors.white,
          child: Text('weather'),
        ))
      ],
    );
  }
}