import 'package:doc_dock/Screens/appointment_pages/appointment_page3.dart';
import 'package:flutter/material.dart';
import '../Screens/view_profile_page.dart';
import '../models/Doctor.dart';

//import '../models/Doctor.dart';
class DoctorList extends StatelessWidget {
  const DoctorList({Key? key, required this.index, required this.docList}) : super(key: key);
  final int index;
  final List<Doctor> docList;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180.0,
      padding: const EdgeInsets.only(left: 10, top: 0,right: 10,bottom: 0),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 70.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xff2A2C28).withOpacity(.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    top: 30,
                    left: 0,
                    right: 2,
                    child: SizedBox(
                      height: height*.07,
                      child:
                      Image.asset(docList[index].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    bottom: 0,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(docList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white70,),),
                        Row(
                          children: [
                            Text(
                              docList[index].speciality,
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              docList[index].experience,
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          docList[index].clinic,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewProfile()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed)?Colors.black87:Color(0xffE2585D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                child:Text('View Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                    color: Colors.white70,
                  ),),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentPage3()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed)?Colors.black87:Color(0xffE2585D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                child:Text('Book appointment',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                    color: Colors.white70,
                  ),),

              ),
              SizedBox(width: 20,),
            ],
          )
        ],
      ),
    );
  }
}
