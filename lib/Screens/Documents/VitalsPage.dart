
import 'package:doc_web_app/CustomUI/documents_tab.dart';
import 'package:flutter/material.dart';

class VitalsPage extends StatefulWidget {
  const VitalsPage({Key? key}) : super(key: key);

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        DocumentTab(label: "Age",text: "19",),
        DocumentTab(label: "Height",text: "172 cm",),
        DocumentTab(label: "Weight",text: "69 kgs",),
        DocumentTab(label: "BMI",text: "22.8",),
        DocumentTab(label: "Blood Group",text: "O -ve"),
        DocumentTab(label: "Haemoglobin Count",text: "13.3",),
        DocumentTab(label: "Sugar Level",text: "98",),

      ]
    );
  }
}
