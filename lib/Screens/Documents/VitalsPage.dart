
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
        DocumentTab(label: "Age"),
        DocumentTab(label: "Height"),
        DocumentTab(label: "Weight"),
        DocumentTab(label: "BMI"),
        DocumentTab(label: "Blood Group"),
        DocumentTab(label: "Haemoglobin Count"),
        DocumentTab(label: "Sugar Level"),

      ]
    );
  }
}
