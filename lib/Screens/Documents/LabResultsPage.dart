
import 'package:flutter/material.dart';

import '../../CustomUI/Document_List.dart';
import '../../models/Document.dart';

class LabResultsPage extends StatefulWidget {
  const LabResultsPage({Key? key}) : super(key: key);

  @override
  State<LabResultsPage> createState() => _LabResultsPageState();
}

class _LabResultsPageState extends State<LabResultsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: height*.2,
      child: ListView.builder(
          itemCount: Document.docList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return DocumentList(index:index,docList: Document.docList);
          }),
    );
  }
}
