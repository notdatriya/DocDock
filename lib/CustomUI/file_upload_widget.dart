
import 'package:flutter/material.dart';

class FileUpload extends StatelessWidget {
  final String label;
  final VoidCallback onClickedSelect;
  final VoidCallback onClickedUpload;
  final TextEditingController controller;
   FileUpload({
    Key? key,
    required this.label,
    required this.controller,
    required this.onClickedSelect,
    required this.onClickedUpload
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            //first child dynamic
            Column(
              children: [
                addDoc(controller,onClickedSelect, onClickedUpload)
              ],
            ),
            //second child
            Row(
              children: [
                ElevatedButton.icon(
                    icon:const Icon(Icons.add),
                    label: const Text('create'),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6FBDB4)),
                    onPressed: (){},

                )
              ],
            )
          ],
        ),
      )
    );
  }
}


Container addDoc(TextEditingController controller,VoidCallback onClickedSelect,VoidCallback onClickedUpload)
{
  return Container(
    decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(20.0)

    ),
    padding: const EdgeInsets.symmetric(vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top:10.0),
            child: TextField(
              controller: controller,
              onChanged: (text) {},
              decoration: InputDecoration(
                hintText: 'Enter sub category',
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: onClickedSelect,
                child: Text('Select File',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? Colors.black87
                      : Color(0xff6FBDB4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: onClickedUpload,
                child: Icon(Icons.upload_outlined,color: Colors.black87,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? Colors.black87
                      : Color(0xff6FBDB4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
