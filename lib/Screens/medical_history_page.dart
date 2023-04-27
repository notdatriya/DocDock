import 'package:doc_dock/CustomUI/file_upload_widget.dart';
import 'package:doc_dock/CustomUI/reusable_widgets.dart';
import 'package:doc_dock/Screens/subcategories/lab_reports_page.dart';
import 'package:doc_dock/Screens/subcategories/scans_page.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * .33,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: height,
              width: width,
              child: Stack(children: [
                Positioned(
                  left: width * .2,
                  top: 20,
                  child: Container(
                    width: width * .6,
                    height: height * .8,
                    child: ListView(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => RootPage()
                              //     ));
                            },
                            child: CategoryTab("Vitals")),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LabReports(
                                            category: "Lab Reports",
                                            dropDownValue: dropdownValue,
                                            aboutData: abt_text,
                                          )));
                            },
                            child: CategoryTab("Lab Reports")),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scans()));
                            },
                            child: CategoryTab("Scans")),
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => RootPage()
                              //     ));
                            },
                            child: CategoryTab("Consultation Reports")),
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => RootPage()
                              //     ));
                            },
                            child: CategoryTab("Vaccination Reports")),
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => RootPage()
                              //     ));
                            },
                            child: CategoryTab("Medical History")),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
