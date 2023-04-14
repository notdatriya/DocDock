import 'package:doc_dock/CustomUI/reusable_widgets.dart';
import 'package:flutter/material.dart';

import '../models/Appointment.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({Key? key, required this.index, required this.appList})
      : super(key: key);

  final int index;
  final List<Appointment> appList;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100.0,
      padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
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
                    top: 10,
                    bottom: 0,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Appointment from " + appList[index].slot,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // Text(
                        //   '23rd April',
                        //   // appList[index].date.toString(),
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 18,
                        //     color: Colors.white70,
                        //   ),
                        // ),
                        Row(
                          children: [
                            Text(
                             // '23rd April',
                               appList[index].date.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "  |  Dr. " +
                                  appList[index].fname +
                                  " " +
                                  appList[index].lname,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                            // Text(
                            //   appList[index].speciality,
                            //   style: TextStyle(
                            //     //fontWeight: FontWeight.bold,
                            //     fontSize: 18,
                            //     color: Colors.white70,
                            //   ),
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
