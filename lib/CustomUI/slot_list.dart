
import 'package:flutter/material.dart';

class SlotList extends StatelessWidget {
  const SlotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
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
          Padding(
              padding: EdgeInsets.only(left: 20)

          )
        ],
      ),
    );
  }
}
