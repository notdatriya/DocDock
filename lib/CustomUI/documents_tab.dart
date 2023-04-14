
import 'package:flutter/material.dart';

class DocumentTab extends StatelessWidget {
  const DocumentTab({Key? key,required this.label}) : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
              child: Text(label)),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              color: Color(0xff2A2C28),
            ),

            height: 50,
            width:300
          )
        ],
      ),
    );
  }
}
