import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:doc_web_app/CustomUI/categories_tab.dart';
import 'package:doc_web_app/Screens/Documents/ConsultationReportsPage.dart';
import 'package:doc_web_app/Screens/Documents/LabResultsPage.dart';
import 'package:doc_web_app/Screens/Documents/MedicalHistoryPage.dart';
import 'package:doc_web_app/Screens/Documents/ScansPage.dart';
import 'package:doc_web_app/Screens/Documents/VaccinesPage.dart';
import 'package:doc_web_app/Screens/Documents/VitalsPage.dart';
import 'package:flutter/material.dart';

import '../models/Document.dart';

class PatientDocuments extends StatefulWidget {
  const PatientDocuments({Key? key}) : super(key: key);

  @override
  State<PatientDocuments> createState() => _PatientDocumentsState();
}

int _categoryIndex = 0;
List<Widget> pages() {
  return [
    VitalsPage(),
    LabResultsPage(),
    ScansPage(),
    ConsultationReportsPage(),
    VaccinesPage(),
    MedicalHistoryPage(),
  ];
}

List<String> categoryList = [
  "Vitals",
  "Lab Reports",
  "Diagonistic Imaging",
  "Consultation Reports",
  "Immunization Reports",
  "Medical History"
];

class _PatientDocumentsState extends State<PatientDocuments> {


  void getpDocData(sub_category) async {
    var url = Uri.parse('https://docdock.onrender.com/getDoc');
    var requestBody = jsonEncode({
      "patient_id": 1,
      "category": sub_category,
      "sub_category": "Heart"
    });
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        },
        body: requestBody);

    print(response.statusCode);
    setState(() {
      // List<dynamic> responseList = jsonDecode((response.body).toString());
      List<dynamic> responseList = (json
          .decode((response.body).toString())
          .map((data) => Document.fromJson(data))).toList();
      Document.docList = responseList.cast<Document>();
      print(responseList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                //grey card
                Positioned(
                    right: width * .6,
                    child: Container(
                      width: width,
                      height: height,
                      color: Color(0xff2A2C28),
                    )),
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
                              child: Text(
                                  'Here are some categories of documents: ',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                    )),
                //Category Tabs
                Positioned(
                    left: width * .037,
                    top: height * .22,
                    child: Container(
                        height: height * .7,
                        width: width * .27,
                        child: ListView.builder(
                            itemCount: categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _categoryIndex = index;
                                      print(categoryList[index]);
                                      getpDocData(categoryList[index]);
                                    });
                                  },
                                  child:
                                      CategoryTab(text: categoryList[index]));
                            }))),
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
                      backgroundColor: Color(0xff151413),
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
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.redAccent),
                    )),

                Positioned(
                  left: width * .376,
                  top: height * .08,
                  child: SingleChildScrollView(
                    child: Container(
                      height: height * .9,
                      width: width * .6,
                      color: Colors.transparent,
                      child: IndexedStack(
                        index: _categoryIndex,
                        children: pages(),
                      ),
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
