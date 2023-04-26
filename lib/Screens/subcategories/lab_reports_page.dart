import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../CustomUI/file_upload_widget.dart';
import '../../api/firebase_api.dart';

class LabReports extends StatefulWidget {
  const LabReports(
      {Key? key,
      required this.category,
      required this.dropDownValue,
      required this.aboutData})
      : super(key: key);
  final String category;
  final String dropDownValue;
  final String aboutData;
  @override
  State<LabReports> createState() => _LabReportsState();
}

class _LabReportsState extends State<LabReports> {
  void addDoc() async {
    var url = Uri.parse('https://docdock.onrender.com/addDoc');
    var requestBody = jsonEncode({
      "patient_id": 1,
      "category": widget.category.toString(),
      "sub_category": widget.dropDownValue,
      "link": urlDownload,
      "about": widget.aboutData
    });
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        },
        body: requestBody);

    print(response.statusCode);
  }

  UploadTask? task;
  File? file;
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Column(
        children: [
          SizedBox(
            height: height * .2,
            child: Center(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                      ),
                      child: Text(
                        'Lab Reports',
                        style: TextStyle(fontSize: 24),
                      ),
                    ))),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 340,
              child: FileUpload(
                label: "Enter subcategory",
                controller: _controller,
                onClickedSelect: selectFile,
                onClickedUpload: uploadFile,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  String urlDownload = '';
  Future uploadFile() async {
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
    addDoc();
    // return urlDownload;
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
