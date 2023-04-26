
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../CustomUI/file_upload_widget.dart';
import '../../api/firebase_api.dart';

// 0xff303131
class LabReports extends StatefulWidget {
  const LabReports({Key? key}) : super(key: key);

  @override
  State<LabReports> createState() => _LabReportsState();
}

class _LabReportsState extends State<LabReports> {
  UploadTask? task;
  File? file;
  TextEditingController _controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Column(
        children: [
          SizedBox(height: height*.2,child:
          Center(child:
          Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0,),
                child: Text('Lab Reports',style: TextStyle(fontSize: 24),),
              ))),),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 280,
              child: FileUpload(
                label:"Enter subcategory",
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

  Future uploadFile() async {
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) =>
      StreamBuilder<TaskSnapshot>(
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