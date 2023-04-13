
import 'package:flutter/material.dart';

import 'Appointment.dart';

class AppointmentTab extends StatelessWidget {
  const AppointmentTab({
    Key? key,

    required this.index,
    required this.appList
  }) : super(key: key);

    final int index;
    final List<Appointment>appList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
        child: Container(
          height: 60,
          width: 670,
          decoration: BoxDecoration(
            color: Color(0xff2A2C28),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60.0),
              topLeft: Radius.circular(60.0),
              bottomLeft: Radius.circular(60.0),
            ),
          ),
          child: Stack(
            children: [
            Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xff83BD6F),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60.0),
                topLeft: Radius.circular(60.0),
                bottomLeft: Radius.circular(60.0),
              ),
            ),
              child: Center(child: Text(
                          '${appList[index].slot}',
                         // '3:30 to 4:30 PM',//slot
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              )),//hardcoded for now
            ),
              Positioned(
                  left:230,
                  top: 21,
                  child: Row(children: [
                    Text(
                      '${appList[index].fname} ',
                      // 'Sanidhya ',//fname
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white70),
                    ),

                    Text(
                      '${appList[index].lname}  |  ',
                      //'Kumar  |  ',//lname
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white70),
                    ),
                    Text(
                      '${appList[index].gender}  |  ',
                      //'Male  |  ',//fname
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white70),
                    ),

                    Text(
                      '${appList[index].age} Yrs',
                      //'19 yrs ',//lname
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white70),
                    ),
                     SizedBox(width: 180,),
                    // CircleAvatar(
                    //   backgroundColor: Color(0xff83BD6F) ,
                    //   radius: 14,
                    //   child: Icon(Icons.arrow_forward_ios, color: Colors.black38,),
                    // )

              ],)
              ),
              Positioned(
                  right:30,
                  top: 14.5 ,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff83BD6F) ,
                    radius: 16,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.black54,),
              ))
            ],
          ),
        ),
    );
  }
}
