import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doc_dock/models/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../CustomUI/reusable_widgets.dart';
import '../root_page.dart';

class AppointmentPage4 extends StatefulWidget {
  const AppointmentPage4(
      {Key? key,
      required this.selectedDate,
      required this.selectedSlot,
      required this.ogDocId})
      : super(key: key);
  final int ogDocId;
  final DateTime selectedDate;
  final String selectedSlot;
  @override
  State<AppointmentPage4> createState() => _AppointmentPage4State();
}

class _AppointmentPage4State extends State<AppointmentPage4> {
  TextEditingController _notesController = new TextEditingController();

  void book(date, slot, remark) async {
    var url = Uri.parse('https://docdock.onrender.com/book');
    var requestBody = jsonEncode({
      "doctor_id": widget.ogDocId,
      "patient_id": 1,
      "_date": DateFormat('yyyy-MM-dd').format(date),
      "slot": slot.toString(),
      "remarks": remark.toString(),
    });
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        },
        body: requestBody);

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    String saveText() {
      String text = _notesController.text;
      print(text);
      return text; // Do something with the text here
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff151413),
        body: Stack(children: [
          Column(children: [
            SizedBox(
              height: height * .15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .08,
                ),
                Text(
                  'Review and Book',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            DocTile(0, height, width, Doctor.docList),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .08,
                ),
                Text(
                  'Date and Time',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2A2C28),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50.0,
              padding:
                  const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: width * .9,
              child: Row(
                children: [
                  // Icon(Icons.arrow_back_ios,color: Colors.white38,),
                  // SizedBox(width: 60,),
                  // Icon(Icons.calendar_month),
                  // SizedBox(width: 10,),
                  // Text(_dateTime.weekday.toString()),
                  // SizedBox(width: 5,),
                  // Text(_dateTime.day.toString()),
                  // SizedBox(width: 5,),
                  // Text(_dateTime.month.toString()),
                  SizedBox(
                    width: 20,
                  ),

                  if (widget.selectedDate != null)
                    Text(
                      DateFormat(
                              'EEEE, d\'${_getOrdinalSuffix(widget.selectedDate.day)}\' MMMM')
                          .format(widget.selectedDate),
                      style: TextStyle(fontSize: 17),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '( ' + widget.selectedSlot + ' )',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .08,
                ),
                Text(
                  'Notes (Optional)',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xff2A2C28),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter some msg for the doc . . .',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    controller: _notesController,
                    maxLength: 100,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {}),
              ),
            ),
          ]),

          //top indicator
          Positioned(
            bottom: height * .92,
            left: width * .07,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          //floating action button
          Positioned(
              top: height * .88,
              left: width * .05,
              child: SizedBox(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        //currentIndex+=1;
                        Navigator.pop(context);
                      });
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    backgroundColor: Color(0xff6FBDB4)),
              )),

          Positioned(
              top: height * .88,
              right: width * .08,
              child: SizedBox(
                height: 60,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: Center(
                        child: Text(
                          'Your appointment was booked successfully!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      btnOkOnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RootPage()));
                      },
                    )..show();
                    // saveText();
                    setState(() {
                      String text = saveText();
                      book(widget.selectedDate, widget.selectedSlot, text);
                    });
                  },
                  child: Text('Confirm Appointment',
                      style: TextStyle(
                          color: Color(0xff151413),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => states.contains(MaterialState.pressed)
                            ? Color(0xff2A2C28)
                            : Color(0xff6FBDB4)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                  ),
                ),
              )),
        ]));
  }
}

List<Widget> _buildIndicator() {
  List<Widget> indicators = [];

  // for (int i = 0; i < 4; i++) {
  //   if (currentIndex <= i-1) {
  //     indicators.add(_indicator(true));
  //   } else {
  //     indicators.add(_indicator(false));
  //   }
  // }

  for (int i = 0; i < 4; i++) {
    if (3 <= i - 1) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

@override
Widget build(BuildContext context) {
  final deviceheight = MediaQuery.of(context).size.height;
  return Container(
    // decoration: BoxDecoration(
    //                     color: AppColors.loginbgColor,
    //                     ),
    padding: const EdgeInsets.only(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.only(top: 0.0),
          child: SizedBox(
            height: deviceheight * .4,
          ),
        ),
      ],
    ),
  );
}

//Create the indicator decorations widget
Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: 85,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      // backgroundBlendMode: BlendMode.darken,
      color: isActive ? Colors.white70 : Color(0xff6FBDB4),
      borderRadius: BorderRadius.circular(9),
    ),
  );
}

String _getOrdinalSuffix(int day) {
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
