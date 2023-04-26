
import 'package:flutter/material.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
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
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2A2C28),
        borderRadius: BorderRadius.circular(20)
      ),
      width: width*.9,
      child:Column(
        children: [
          SizedBox(height: 50),
        Container(
          height: 60,
          width: 220,
          decoration: BoxDecoration(
              color: Color(0xff151413),
              borderRadius: BorderRadius.circular(10)),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(child: DropdownButtonExample()),
          ),
        ),
        SizedBox(height: 38),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: onClickedSelect,
                child: Text('Select File',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
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
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: onClickedUpload,
                child: Text('Upload File',
                style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
                //Icon(Icons.upload_outlined,color: Colors.black87,),
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
      )
    );
  }
}



class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: const TextStyle(color: Colors.white70,fontSize: 20),
      underline: Container(
        height: 0,
        color: Colors.white70,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}



// TextField(
//   controller: controller,
//   onChanged: (text) {},
//   decoration: InputDecoration(
//     hintText: 'Enter sub category',
//     border: InputBorder.none,
//     contentPadding:
//     EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     labelStyle: TextStyle(color: Colors.white70),
//   ),
// ),