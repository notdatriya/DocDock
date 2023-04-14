// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../CustomUI/appointment_tab.dart';
import '../models/Appointment.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
// List docAppListi = [];

  void getDocAppData(picked) async {
    var url = Uri.parse('https://docdock.onrender.com/doctor/app');
    var requestBody = jsonEncode(
        {"doctor_id": 1, "_date": DateFormat('yyyy-MM-dd').format(picked)});
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        },
        body: requestBody);

    print(response.statusCode);
    setState(() {
      // List<dynamic> responseList = jsonDecode((response.body).toString());
      List<dynamic> docAppListi = (json
          .decode((response.body).toString())
          .map((data) => Appointment.fromJson(data))).toList();
      Appointment.appList = docAppListi.cast<Appointment>();
      print(picked);
      print(docAppListi);
    });
  }

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      getDocAppData(today);
    });
  }

  // @override
  // void initState() {
  //   print("appdata here");
  //   getDocAppData(today);
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                //grey card
                Positioned(
                    right: width * .6,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff2A2C28),
                    )),
                //black card
                Positioned(
                    left: width * .35,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff151413),
                    )),
                //notification icon
                Positioned(
                  top: height * 0.05,
                  left: width * .015,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff151413),
                      radius: 23,
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white38,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height * 0.05,
                    left: width * .048,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.redAccent),
                    )),
                //welcome and greeting card
                Positioned(
                    top: height * .15,
                    left: width * .048,
                    child: Container(
                      width: 300,
                      height: 200,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Welcome Shipli 👋',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Here\'s a list of appointments for the day',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                    )),

                //Calendar
                Positioned(
                    top: height * .28,
                    left: width * .04,
                    child: Container(
                      width: 300,
                      height: 340,
                      color: Colors.transparent,
                      child: TableCalendar(
                        focusedDay: today,
                        firstDay: DateTime.now(),
                        lastDay: DateTime.now().add(Duration(days: 7)),
                        locale: "en_US",
                        rowHeight: 43,
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(color: Colors.white70)),
                        availableGestures: AvailableGestures.all,
                        onDaySelected: _onDaySelected,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: false,
                          defaultTextStyle: TextStyle(color: Colors.white38),
                          weekendTextStyle: TextStyle(color: Colors.white38),
                          outsideDaysVisible: false,
                          withinRangeTextStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),

                //logout button
                Positioned(
                    bottom: height * 0.08,
                    left: width * 0.1,
                    child: SizedBox(
                      height: 40,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Logout',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => states.contains(MaterialState.pressed)
                                  ? Colors.black87
                                  : Color(0xffE2585D)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                        ),
                      ),
                    )),

                //Current date Right side
                Positioned(
                    left: width * .6,
                    top: height * .05,
                    child: Row(
                      children: [
                        //hardcoded rn
                        //Text('3rd April 2023',style: TextStyle(color: Colors.white70,fontSize: 20),
                        Text(
                          DateFormat(
                                  'd\'${_getDaySuffix(today.day)}\' MMMM, yyyy')
                              .format(today),
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        )
                      ],
                    )),
                Positioned(
                    left: width * .4,
                    top: height * .12,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: height * .4,
                          width: width * .55,
                          child: ListView.builder(
                              itemCount: Appointment.appList.length,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return AppointmentTab(
                                  index: index,
                                  appList: Appointment.appList,
                                );
                              }),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
