
import 'package:flutter/material.dart';

class FileUpload extends StatelessWidget {
  final String label;
  final VoidCallback onClickedSelect;
  final VoidCallback onClickedUpload;
   FileUpload({
    Key? key,
    required this.label,
    required this.onClickedSelect,
    required this.onClickedUpload
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(

        children: [
          Text(label,
            style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Select File',
                    style: TextStyle(
                        color: Colors.white70,
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
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload File',
                    style: TextStyle(
                        color: Colors.white70,
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
            ],
          )
        ],
      ),
    );
  }
}
