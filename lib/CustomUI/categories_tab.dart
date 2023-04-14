
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xff83BD6F),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60.0),
            topLeft: Radius.circular(60.0),
            bottomLeft: Radius.circular(60.0),
          ),
        ),
        child: Center(child: Text(
          text,
          // '3:30 to 4:30 PM',//slot
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black54),
        )),//hardcoded for now
      ),
    );
  }
}
