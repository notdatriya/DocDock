
import 'package:flutter/material.dart';

import '../../CustomUI/reusable_widgets.dart';
import '../../models/Doctor.dart';
import 'appointment_page4.dart';
import 'package:intl/intl.dart';


class AppointmentPage3 extends StatefulWidget {
  const AppointmentPage3({Key? key,required this.currDocId}) : super(key: key);
  final int currDocId;
  @override
  State<AppointmentPage3> createState() => _AppointmentPage3State();
}

class _AppointmentPage3State extends State<AppointmentPage3> {

  DateTime _selectedDate=DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

      });
    }
  }

  // DateTime _dateTime=DateTime.now();
  // void _showDatePicker()
  // {
  //
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2023),
  //     lastDate: DateTime.now().add(Duration(days: 7)),
  //     //DateTime(2023,4,DateTime.now()+7),
  //
  //   ).then((value) {
  //     setState(() {
  //       _dateTime=value!;
  //
  //       print(_dateTime.weekday);
  //     }
  //
  //     );
  //   }
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    print('hello');
    print(widget.currDocId);
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Stack(
        children:
        [
          Column(
            children:[
              SizedBox(height: height*.15,),
              Row(crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  SizedBox(width: width*.08,),
                  Text('Select a time slot',style: TextStyle(
                    color:Colors.white70,
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                  ),)
                ],),
              SizedBox(height: 15,),
              DocTile(widget.currDocId-1, height, width,Doctor.docList),
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
                    // SizedBox(width: 140,),
                    IconButton(
                        onPressed:() => _selectDate(context),
                        //_showDatePicker,
                        icon: Icon(Icons.calendar_month,)),
                    if (_selectedDate != null)
                      Text(
                        DateFormat('EEEE, d\'${_getOrdinalSuffix(_selectedDate.day)}\' MMMM').format(_selectedDate),
                        style: TextStyle(fontSize: 17),
                      ),
                  ],
                ),
              ),
              Container(
                // decoration: BoxDecoration(
                //   color: Color(0xff2A2C28),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                height: 50.0,
                padding: const EdgeInsets.only(left: 10, top: 0,right: 10,bottom: 0),
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                width: width*.9,
                child: Row(
                  children: [
                    Text("Pick time (6 slots available)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white70),),
                  ],
                ),
              )
            ]
        ),
          Positioned(
            bottom: height*.92,
            left: width*.07,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
              top:height*.88,right:width*.05,
              child: SizedBox(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        //currentIndex+=1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppointmentPage4(currDocId: widget.currDocId,selectedDate: _selectedDate,)
                            ));
                      }
                      );
                    },
                    child: Icon(Icons.arrow_forward,color: Colors.black ,),
                    backgroundColor:Color(0xff6FBDB4)
                ),
              )
          ),
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
      ],
      ),
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
      if (2 <= i-1) {
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

