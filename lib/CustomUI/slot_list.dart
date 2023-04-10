
import 'package:flutter/material.dart';

import '../models/Slot.dart';

class SlotList extends StatelessWidget {
  const SlotList({Key? key,required this.index,required this.slotList}) : super(key: key);
  final int index;
  final List<Slot> slotList;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        //slotList[index].isSelected?Color(0xff6FBDB4):
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80.0,
      padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                    top: 20,
                    bottom: 0,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          slotList[index].slot_text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
