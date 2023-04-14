
import 'package:doc_web_app/CustomUI/categories_tab.dart';
import 'package:doc_web_app/Screens/Documents/ConsultationReportsPage.dart';
import 'package:doc_web_app/Screens/Documents/LabResultsPage.dart';
import 'package:doc_web_app/Screens/Documents/MedicalHistoryPage.dart';
import 'package:doc_web_app/Screens/Documents/ScansPage.dart';
import 'package:doc_web_app/Screens/Documents/VaccinesPage.dart';
import 'package:doc_web_app/Screens/Documents/VitalsPage.dart';
import 'package:flutter/material.dart';

class PatientDocuments extends StatefulWidget {
  const PatientDocuments({Key? key}) : super(key: key);

  @override
  State<PatientDocuments> createState() => _PatientDocumentsState();
}
int _categoryIndex = 0;
List<Widget> pages() {
  return [
    ScansPage(),
    LabResultsPage(),
    VitalsPage(),
    VaccinesPage(),
    ConsultationReportsPage(),
    MedicalHistoryPage(),
  ];
}
List<String> categoryList = [
  "Diagonistic Imaging",
  "Lab Results",
  "Vitals",
  "Immunization Reports",
  "Consultation Reports",
  "Medical History"
];

class _PatientDocumentsState extends State<PatientDocuments> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                //grey card
                Positioned(
                    right:width*.6,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff2A2C28),
                    )
                ),
                //Category Tabs
                Positioned(
                  left:width*.037,
                  top:height*.22,
                    child: Container(
                        height: height*.7,
                        width: width*.27,
                        child:
                        ListView.builder(
                          itemCount: categoryList.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _categoryIndex=index;
                                  });
                                },
                                  child: CategoryTab(text: categoryList[index])
                              );
                            }
                        )
                    )
                ),
                //different pages
                Positioned(
                    left: width * .35,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff151413),
                    )),
                //notification icon
                Positioned(
                  top: height * 0.05,
                  left: width * .015,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      backgroundColor:  Color(0xff151413),
                      radius: 23,
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white38,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height * 0.05,
                    left: width * .048,
                    child:Container(
                      height: 12,
                      width: 12,
                      decoration:
                      BoxDecoration(
                          shape: BoxShape.circle ,
                          color: Colors.redAccent
                      ),)
                ),

                //welcome and greeting card
                Positioned(
                    top: height * .15,
                    left: width * .048,
                    child: Container(
                      width: 300,
                      height: 200,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Here are some categories of documents: ',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                    )
                ),

                Positioned(
                    left: width * .43,
                    top: height* .12,
                    child: Container(
                      height: height*.8,
                      width: width*.5,
                      color: Colors.transparent,
                      child: IndexedStack(
                          index: _categoryIndex,
                          children: pages(),
                      ),
                    ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
