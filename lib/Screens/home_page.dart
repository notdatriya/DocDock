import 'package:doc_dock/Screens/profile_page.dart';
import 'package:doc_dock/models/Appointment.dart';
import 'package:flutter/material.dart';

import '../CustomUI/app_list.dart';
import '../CustomUI/reusable_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List applisti = [];
  void getAppData() async {
    var url = Uri.parse('https://docdock.onrender.com/app/1');
    var response = await http.get(url);
    print(response.statusCode);

    // decoding the response
    print((jsonDecode(response.body)).toString());
    setState(() {
      // List<dynamic> responseList = jsonDecode((response.body).toString());
      List<dynamic> appListi = (json
          .decode((response.body).toString())
          .map((data) => Appointment.fromJson(data))).toList();
      Appointment.appList = appListi.cast<Appointment>();
      // print(responseList);
    });
  }

  @override
  void initState() {
    print("appdata here");
    getAppData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            bottom: height * .4,
            child: Container(
              width: width,
              height: height,
              color: Color(0xff2A2C28),
            )),
        Positioned(
            //top:0,
            bottom: height * .29,
            left: width * 0.49,
            width: width * 0.5 * 0.9,
            height: height * .8 * .9,
            child:
                Container(child: Image(image: AssetImage('assets/img.png')))),
        Positioned(
          top: height * 0.05,
          left: width * .04,
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xff151413),
                  radius: 25,
                  backgroundImage: AssetImage('assets/profile_pic.png'),
                ),
              )),
        ),
        Positioned(
          top: height * 0.05,
          right: width * .04,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white38,
                size: 30.0,
              ),
            ),
          ),
        ),
        Positioned(
            top: height * .41,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Color(0xff151413),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60.0),
                  topLeft: Radius.circular(60.0),
                ),
              ),
            )),
        Positioned(
            top: height * .15,
            left: width * .075,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Welcome!',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 14,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Shipli',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('How can we help you?',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                          )))
                ],
              ),
            )),
        Positioned(
            top: height * 0.32,
            left: width * 0.075,
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Call Ambulance',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Colors.black87
                          : Color(0xffE2585D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                ),
              ),
            )),
        Positioned(
            top: height * .45,
            left: width * .089,
            child: Row(
              children: [
                Text('My Appointments',
                    style: TextStyle(color: Colors.white70, fontSize: 22))
              ],
            )),
        Positioned(
            top: height * .51,
            left: width * .025,
            width: width * .95,
            height: height * .13,
            // child: AppointmentCard(
            //     "Appointment at 9 pm", "\nDr. Riya \n Ajayan Hospital "),
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 4, //change dynamically later
                itemBuilder: (BuildContext context, int index) {
                  return AppointmentList(
                    index: index,
                    appList: Appointment.appList,
                  );
                })),
      ],
    ));
  }
}
