
import 'package:flutter/material.dart';

import '../Screens/appointment_pages/appointment_page4.dart';
import '../models/Slot.dart';

class SlotList extends StatelessWidget {
  const SlotList({Key? key,required this.index,required this.slotList,required this.selectedDate,required this.ogDocId}) : super(key: key);
  final int index;
  final int ogDocId;
  final List<Slot> slotList;
  final DateTime selectedDate;


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    bool sflag = true;

    if(slotList[0].slot_text == "No slots available :("){
      sflag = false;
    }

    print(sflag);

    print(slotList[0].slot_text);
    return GestureDetector(
      onTap: (){
        if (sflag){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AppointmentPage4(
                    //currDocId: widget.ogDocId,
                    selectedDate: selectedDate,
                    selectedSlot:   slotList[index].slot_text,
                    ogDocId: ogDocId,
                  )));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2A2C28),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60.0,
        padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        //width: width*.9,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0,
                  height: 40,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Container(
                      //   width: 70.0,
                      //   height: 100.0,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xff2A2C28).withOpacity(.7),
                      //     shape: BoxShape.circle,
                      //   ),
                      // ),
                      Positioned(
                       // top: 20,
                       //  top: 0,
                       //  right: 0,
                        bottom: 0,
                        left: 15,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              // height: 800,
                              // width: 300,
                              child: Container(
                                height:33,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      slotList[index].slot_text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),

                      // Positioned(
                      //   // top: 20,
                      //   //  top: 0,
                      //   //  right: 0,
                      //   bottom: 0,
                      //   right: 15,
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Flexible(
                      //         // height: 800,
                      //         // width: 300,
                      //         child: CircleAvatar(
                      //           child:Icon(Icons.arrow_right,color: Colors.white70,)
                      //         )
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0,
                  height: 40,
                  child: sflag ? Stack(
                    clipBehavior: Clip.none,

                    children: [
                      Positioned(
                        // top: 20,
                        //  top: 0,
                        //  right: 0,
                        bottom: -8,
                        top:11,
                        right: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              // height: 800,
                              // width: 300,
                              child: CircleAvatar(

                                backgroundColor:Color(0xff6FBDB4),
                                child:Icon(Icons.arrow_right,color: Color(0xff151413),size: 35,)
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ) : Container(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
