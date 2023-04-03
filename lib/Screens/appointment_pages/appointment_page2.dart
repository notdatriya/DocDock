
import 'package:flutter/material.dart';

import '../../CustomUI/doc_list.dart';
import '../../models/Doctor.dart';
import 'appointment_page1.dart';
import 'appointment_page3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentPage2 extends StatefulWidget {
  const AppointmentPage2({Key? key}) : super(key: key);
  //final String field="";
  @override
  State<AppointmentPage2> createState() => _AppointmentPage2State();
}

class _AppointmentPage2State extends State<AppointmentPage2> {
  var docData={};

  void getDocData() async {
    print('yes');
      var url = Uri.parse('http://192.168.136.165:3000/hello');
      var response = await http.get(url);
      print('ok');
      print(response.statusCode);
      print((jsonDecode(response.body)).toString());
      setState(() {
        // Doctor.docList = ((response.body).toString() as dynamic).map((data) => Doctor.fromJson(data)).toList();
        Doctor.docList = (jsonDecode(response.toString()) as List<dynamic>)
            .map((dynamic personJson) => Doctor.fromJson(personJson))
            .toList();
        print("Doctor.docList");
        print('s');
      });
    }

    @override
    void initState()
    {

      print("ddd");
      getDocData();
      super.initState();

    }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Stack(
        children:[
          Column(
          children: [
            SizedBox(height: height*.12,),
            Row(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(width: width*.08,),
                const Text("Select Doctor",style: TextStyle(
                  color:Colors.white70,
                  fontSize:25,
                  fontWeight: FontWeight.bold,
                ),)
              ],),
            // Row(
            //   children: [
            //     Icon(Icons.search),
            //     TextField(
            //       controller: _textEditingController,
            //       decoration: InputDecoration(
            //         fillColor: Color(0xff2A2C28),
            //         hintText: 'Search...',
            //         prefixIcon: Icon(Icons.search),
            //       ),
            //     ),
            //   ],
            // ),
           // SizedBox(height:2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: height * .8,
              child: ListView.builder(
                  itemCount: Doctor.docList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return DoctorList(index: index, docList: Doctor.docList);
                  }),
            ),
          ],),
          Positioned(
            bottom: height*.92,
            left: width*.07,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            top: height*.92,
            right: width*.07,
            child: ElevatedButton(
              onPressed: (){getDocData();},
              child: Text('Press me'),
            ),
          ),
          // Positioned(
          //     top:height*.88,right:width*.05,
          //     child: SizedBox(
          //       height: 60,
          //       width: 60,
          //       child: FloatingActionButton(
          //           onPressed: (){
          //             setState(() {
          //               //currentIndex+=1;
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(builder: (context) => AppointmentPage3()
          //                   ));
          //             }
          //             );
          //           },
          //           child: Icon(Icons.arrow_forward,color: Colors.black ,),
          //           backgroundColor:Color(0xff6FBDB4)
          //       ),
          //     )
          // ),
          Positioned(
              top:height*.88,left:width*.05,
              child: SizedBox(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        //currentIndex+=1;
                        Navigator.pop(
                            context
                            );
                      }
                      );
                    },
                    child: Icon(Icons.arrow_back,color: Colors.black ,),
                    backgroundColor:Color(0xff6FBDB4)
                ),
              )
          ),
        ],

      )
    );

}
List<Widget> _buildIndicator() {
  List<Widget> indicators = [];

  // for (int i = 0; i < 4; i++) {
  //   if (currentIndex <= i-1) {
  //     indicators.add(_indicator(true));
  //   } else {
  //     indicators.add(_indicator(false));
  //   }
  // }

  for (int i = 0; i < 4; i++) {
    if (1 <= i-1) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}
}

@override
Widget build(BuildContext context) {
  final deviceheight = MediaQuery.of(context).size.height;
  return Container(
    // decoration: BoxDecoration(
    //                     color: AppColors.loginbgColor,
    //                     ),
    padding: const EdgeInsets.only(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          alignment: Alignment.center,
          // padding: const EdgeInsets.only(top: 0.0),
          child: SizedBox(
            height: deviceheight * .4,
          ),
        ),
      ],
    ),
  );
}

//Create the indicator decorations widget
Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: 85,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      // backgroundBlendMode: BlendMode.darken,
      color: isActive ?Colors.white70:Color(0xff6FBDB4),
      borderRadius: BorderRadius.circular(9),
    ),
  );
}

// class Doctor {
//   final int doctorId;
//   final String name;
//   final String experience;
//   final String clinic;
//   final String speciality;
//   final String imageURL;
//
//   Doctor({
//     this.doctorId = 0,
//     this.speciality = "",
//     this.name = "",
//     this.experience = "0 yrs",
//     this.clinic = "",
//     this.imageURL = "",
//   });
//
//   factory Doctor.fromJson(Map<dynamic, dynamic>json)
//   {
//     return Doctor(
//       doctorId: json['doctorId'],
//       speciality: json['speciality'],
//       name: json['name'],
//       experience: json['experience'],
//       clinic: json['clinic'],
//       imageURL: json['imageURL'],
//     );
//   }
// }
//   void main(){
//    // final jsonString=docData;
//     final List<Doctor> docList = docData.map((json)=>Doctor.fromJson(json)).toList();
//   }
// }