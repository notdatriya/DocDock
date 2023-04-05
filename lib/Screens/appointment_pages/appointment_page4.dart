
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doc_dock/models/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../CustomUI/reusable_widgets.dart';

class AppointmentPage4 extends StatefulWidget {
  const AppointmentPage4({Key? key,required this.currDocId,required this.selectedDate}) : super(key: key);
  final int currDocId;
  final DateTime selectedDate;
  @override
  State<AppointmentPage4> createState() => _AppointmentPage4State();
}

class _AppointmentPage4State extends State<AppointmentPage4> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body:Stack(
        children:[
           Column(
          children:[
            SizedBox(height: height*.15,),
            Row(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(width: width*.08,),
                Text('Review and Book',style: TextStyle(
                  color:Colors.white70,
                  fontSize:25,
                  fontWeight: FontWeight.bold,
                ),)
              ],),
            SizedBox(height: 15,),
            DocTile(widget.currDocId,height,width,Doctor.docList),
            SizedBox(height: 15,),
            Row(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(width: width*.08,),
                Text('Date and Time',style: TextStyle(
                  color:Colors.white70,
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),)
              ],),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2A2C28),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50.0,
              padding: const EdgeInsets.only(left: 10, top: 0,right: 10,bottom: 0),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: width*.9,
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
                   SizedBox(width: 20,),

                  if (widget.selectedDate != null)
                    Text(
                      DateFormat('EEEE, d\'${_getOrdinalSuffix(widget.selectedDate.day)}\' MMMM').format(widget.selectedDate),
                      style: TextStyle(fontSize: 17),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(width: width*.08,),
                Text('Notes (Optional)',style: TextStyle(
                  color:Colors.white70,
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),)
              ],),
            SizedBox(height: 15,),
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
                    hintText: 'Enter text here',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

        ]
        ),





        //top indicator
        Positioned(
          bottom: height*.92,
          left: width*.07,
          child: Row(
            children: _buildIndicator(),
          ),
        ),
        //floating action button
        Positioned(
            top:height*.88,left:width*.05,
            child: SizedBox(
              height: 60,
              width: 60,
              child: FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      //currentIndex+=1;
                      Navigator.pop(
                          context
                      );
                    }
                    );
                  },
                  child: Icon(Icons.arrow_back,color: Colors.black ,),
                  backgroundColor:Color(0xff6FBDB4)
              ),
            )
        ),

          Positioned(
              top:height*.88,
              right:width*.08,
              child: SizedBox(
                height: 60,
                width: 280,
                child: ElevatedButton(
                  onPressed: (){
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: Center(child: Text(
                        'Your appointment was booked successfully!',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),),
                      btnOkOnPress: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )..show();
                  },
                  child: Text('Confirm Appointment',style:TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.w500)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed)?Colors.black87:Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  ),
                ),
              )
          ),
    ]
      )
    );
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
      if (3 <= i-1) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
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
      color: isActive ?Colors.white70:Color(0xff6FBDB4),
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
