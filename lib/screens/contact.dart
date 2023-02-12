import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart' as telephony;
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;
  addStringToSF(Contact? contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sosList = contact!.phoneNumbers!.join(',');
    print("inside shared prefs 1");
    prefs.setString('sos_contact', sosList);

  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    print("inside shared prefs 2");
    String? stringValue = prefs.getString('sos_contact');
    print(stringValue);
    return stringValue!.split(',');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.only(top: 150),
            child: Stack(children: [
              GestureDetector(
                onTap: () async{
                  List<String> numbers = await getStringValuesSF();
                  if(numbers!=null && !numbers.isEmpty){
                    await sendSMS(message: 'Help!', recipients: numbers);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  // margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/red-circle-round-3d-button-1.png'),
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.8), BlendMode.dstATop),
                      ),
                      color: Colors.red,
                      shape: BoxShape.circle),
                ),
              ),
              Center(
                // margin: EdgeInsets.symmetric(vertical: 110,horizontal: 160),
                child: Text(
                  "SOS",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              )
            ]),
          ),
          Container(

            margin: EdgeInsets.only(top: 200, right: 40),
            child: IconButton(
                onPressed: () async {
                  Contact? contact = await _contactPicker.selectContact();
                  setState(() {
                    _contact = contact;
                    print(_contact!.phoneNumbers.toString());
                    addStringToSF(contact);
                  });
                },
                icon: Icon(
                  Icons.contact_phone_rounded,
                  color: Colors.blueAccent,
                  size: 70,
                )),
          )
        ],
      ),
    );
  }
}
