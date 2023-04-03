import 'package:flutter/material.dart';

import '../models/Doctor.dart';

Card AppointmentCard(String title,String subtitle)
{
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 2,),
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        //side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Color(0xff2A2C28),
      leading: FlutterLogo(size: 72.0),
      title: Text(title, style: TextStyle(color: Colors.white70,fontSize:18,fontWeight: FontWeight.w300),),
      subtitle:Text(subtitle,style: TextStyle(color: Colors.white70,fontSize:12)),
      // trailing: Text(trailing),
      isThreeLine: true,
    ),
  );
}
Container DocTile(int index,double height, double width, List<Doctor> docList)
{
  return
    Container(
      decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120.0,
      padding: const EdgeInsets.only(left: 10, top: 0,right: 10,bottom: 0),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: width*.9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              bottom:0,
              top: 0,
              left: 10,
              child: CircleAvatar(
                radius:32,
                child:Image.asset(docList[index].imageURL),)),
          Positioned(
            top: 15,
            bottom: 10,
            left: 90,
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
    );
}

ListTile SpecialityTile(String text,Image image,bool isSelected)
{
  return  ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(child:image),
      title:Text(text,style: TextStyle(color: isSelected?Colors.black:Colors.white70)),
  );
}
