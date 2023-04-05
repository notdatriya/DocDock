
import 'package:doc_dock/Screens/appointment_pages/appointment_page2.dart';
import 'package:flutter/material.dart';

import '../../CustomUI/reusable_widgets.dart';
import '../../CustomUI/sp_list.dart';
import '../../models/Speciality.dart';

class AppointmentPage1 extends StatefulWidget {
  const AppointmentPage1({Key? key}) : super(key: key);

  @override
  State<AppointmentPage1> createState() => _AppointmentPage1State();
}

class _AppointmentPage1State extends State<AppointmentPage1> {
  //int currentIndex = 0;
  List<bool>isSelected=[false,false,false,false,false,false,false,false,false,false,false,false];
  String field="";
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                //color: Colors.orange,
                color: Color(0xff151413),
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(60.0),
                //   topLeft: Radius.circular(60.0),
                // ),

              ),
              child: Stack(
                  children:[
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: height*.14,),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: width*.08,),
                                      Text("Select Speciality",style: TextStyle(
                                        color:Colors.white70,
                                        fontSize:25,
                                        fontWeight: FontWeight.bold,
                                      ),)
                                    ],),
                                  SizedBox(height: 10,),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding:EdgeInsets.symmetric(horizontal: 10.0),
                                  //     child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2,
                                  //         childAspectRatio: 1.5,
                                  //         crossAxisSpacing: 20,
                                  //         mainAxisSpacing: 20),
                                  //         itemCount: Speciality.spList.length,
                                  //         itemBuilder: (BuildContext context, int index) {
                                  //           return SpecialityList(index: index,
                                  //             spList: Speciality.spList,
                                  //            );}),
                                  //   ),
                                  // ),

                              Expanded(
                                child: GridView.count(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                      childAspectRatio: 1.5,
                                      crossAxisCount: 2,
                                      padding: EdgeInsets.symmetric(horizontal: 20,),
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 30,
                                      //children:
                                      //SpecialityList(index: index,)
                                      children:[
                                           ElevatedButton(
                                           onPressed:(){
                                           setState(() {
                                             field="Physician";
                                           for(int i =0;i<12;i++)
                                             {
                                               if(i==0)
                                                 isSelected[i]=true;
                                               else
                                                 isSelected[i]=false;
                                             }

                                           });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[0]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("General Medicine",Image.asset("assets/profile_pic.png"),isSelected[0])),
                                            ElevatedButton(
                                                onPressed:(){
                                                  setState(() {
                                                    field="Gynaecologist";
                                                    for(int i =0;i<12;i++)
                                                    {
                                                      if(i==1)
                                                        isSelected[i]=true;
                                                      else
                                                        isSelected[i]=false;
                                                    }

                                                  });},
                                                style:ElevatedButton.styleFrom(
                                                  primary:isSelected[1]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                ),
                                                child: SpecialityTile("Women's health",Image.asset("assets/profile_pic.png"),isSelected[1])),
                                            ElevatedButton(
                                                onPressed:(){
                                                  setState(() {
                                                    field="Cardiologist";
                                                    for(int i =0;i<12;i++)
                                                    {
                                                      if(i==2)
                                                        isSelected[i]=true;
                                                      else
                                                        isSelected[i]=false;
                                                    }

                                                  });},
                                                style:ElevatedButton.styleFrom(
                                                  primary:isSelected[2]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                ),
                                                child: SpecialityTile("Heart",Image.asset("assets/profile_pic.png"),isSelected[2])),
                                            ElevatedButton(
                                                onPressed:(){
                                                  setState(() {
                                                    field="Dermatologist";
                                                    for(int i =0;i<12;i++)
                                                    {
                                                      if(i==3)
                                                        isSelected[i]=true;
                                                      else
                                                        isSelected[i]=false;
                                                    }

                                                  });},
                                                style:ElevatedButton.styleFrom(
                                                  primary:isSelected[3]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                ),
                                                child: SpecialityTile("Skin & Hair",Image.asset("assets/profile_pic.png"),isSelected[3])),
                                        ElevatedButton(
                                            onPressed:(){
                                              field="Dentist";
                                              setState(() {
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==4)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[4]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Dental Care",Image.asset("assets/profile_pic.png"),isSelected[4])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Urologist";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==5)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[5]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Kindey & Urinary issues",Image.asset("assets/profile_pic.png"),isSelected[5])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Orthopedic";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==6)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[6]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Bone & Joints",Image.asset("assets/profile_pic.png"),isSelected[6])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Pediatrician";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==7)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[7]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Child Specialist",Image.asset("assets/profile_pic.png"),isSelected[7])),

                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Ayurveda";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==8)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[8]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Ayurveda",Image.asset("assets/profile_pic.png"),isSelected[8])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Surgeon";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==9)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[9]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("General surgery",Image.asset("assets/profile_pic.png"),isSelected[9])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Gastroenterologist";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==10)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[10]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            child: SpecialityTile("Digestive Issues",Image.asset("assets/profile_pic.png"),isSelected[10])),
                                        ElevatedButton(
                                            onPressed:(){
                                              setState(() {
                                                field="Opthalmologist";
                                                for(int i =0;i<12;i++)
                                                {
                                                  if(i==11)
                                                    isSelected[i]=true;
                                                  else
                                                    isSelected[i]=false;
                                                }

                                              });},
                                            style:ElevatedButton.styleFrom(
                                              primary:isSelected[11]?Color(0xff6FBDB4):Color(0xff2A2C28),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                           child: SpecialityTile("Eye Specialist",Image.asset("assets/profile_pic.png"),isSelected[11])),
                                  ],
                                ),
                              ),
                            ],),

                            ),]
                        ),
                      ),
                    ),
                    Positioned(
                      bottom:0,
                      width: width,
                      height: height*.02,
                      child: Container(color: Color(0xff151413),),
                    )
                  ]
              ),
            ),

            // Positioned(
            //     top:height*.82,left:width*.05,
            //     child: SizedBox(
            //       height: 60,
            //       width: 60,
            //       child: currentIndex>0?FloatingActionButton(
            //           onPressed: (){
            //             setState(() {
            //               currentIndex-=1;
            //             });
            //           },
            //           child: Icon(Icons.arrow_back,color: Colors.black ,),
            //           backgroundColor:Color(0xff6FBDB4)
            //       ):Container(),
            //     )),
            Positioned(
                top:height*.82,right:width*.05,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                      onPressed: (){
                        setState(() {
                          //currentIndex+=1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AppointmentPage2(field:field)
                              ));
                        }
                        );
                      },
                      child: Icon(Icons.arrow_forward,color: Colors.black ,),
                      backgroundColor:Color(0xff6FBDB4)
                  ),
                )
            ),



            Positioned(
              bottom: height*.85,
              left: width*.07,
              child: Row(
                children: _buildIndicator(),
              ),
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
    if (0 <= i-1) {
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
