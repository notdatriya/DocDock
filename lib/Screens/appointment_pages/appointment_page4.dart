
import 'package:flutter/material.dart';

class AppointmentPage4 extends StatefulWidget {
  const AppointmentPage4({Key? key}) : super(key: key);

  @override
  State<AppointmentPage4> createState() => _AppointmentPage4State();
}

class _AppointmentPage4State extends State<AppointmentPage4> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body:Stack(
        children:[
           Column(
          children:[
            SizedBox(height: height*.15,),
            Row(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(width: width*.08,),
                Text('Review and Book',style: TextStyle(
                  color:Colors.white70,
                  fontSize:25,
                  fontWeight: FontWeight.bold,
                ),)
              ],),
            SizedBox(height: 15,),
          ]
        ),

        Positioned(
          bottom: height*.92,
          left: width*.07,
          child: Row(
            children: _buildIndicator(),
          ),
        ),

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
    ]
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
      if (3 <= i-1) {
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
