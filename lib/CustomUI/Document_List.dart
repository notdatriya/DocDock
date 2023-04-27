
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../models/Document.dart';

class DocumentList extends StatelessWidget {
  const DocumentList({Key? key,required this.index,required this.docList}) : super(key: key);

  final int index;
  final List<Document> docList;
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://flutter.dev');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 70.0,
      padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 5,
            top: 25,
            left: 15,
            right: 2,
            child: SizedBox(
              height: height * .07,
              child: Text(docList[index].name,
                style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white70,
              ),),
            ),
          ),
          Positioned(
            top: 25,
            bottom: 0,
            left: 120,
            child: GestureDetector(
              onTap: () {
                _launchUrl(Uri.parse(docList[index].doclink));},
              child: Container(
                width: 680,
                child: Text(
                  docList[index].doclink.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                   // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      );

  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
