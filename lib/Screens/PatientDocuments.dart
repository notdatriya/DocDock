
import 'package:flutter/material.dart';

class PatientDocuments extends StatefulWidget {
  const PatientDocuments({Key? key}) : super(key: key);

  @override
  State<PatientDocuments> createState() => _PatientDocumentsState();
}

class _PatientDocumentsState extends State<PatientDocuments> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
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
                    right:width*.6,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff2A2C28),
                    )
                ),
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
                      backgroundColor:  Color(0xff151413),
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
                    child:Container(
                      height: 12,
                      width: 12,
                      decoration:
                      BoxDecoration(
                          shape: BoxShape.circle ,
                          color: Colors.redAccent
                      ),)
                ),

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
                              child: Text('Here are some categories of documents: ',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                    )
                ),

                Positioned(
                    left: width * .4,
                    top: height* .12,
                    child: Column(
                      children: [
                        // Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 12),
                        //   height: height * .4,
                        //   width: width * .55,
                        //   child: ListView.builder(
                        //
                        //       itemCount: Appointment.appList.length,
                        //       scrollDirection: Axis.vertical,
                        //       physics: const BouncingScrollPhysics(),
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return AppointmentTab(
                        //           index: index,
                        //           appList: Appointment.appList,
                        //         );
                        //       }),
                        // )
                      ],
                    )
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
