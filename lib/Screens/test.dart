import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

void data() async {
  print('yes');
  var url = Uri.parse('http://192.168.136.165:3000/hello');
  var response = await http.get(url);
  print('ok');
  print(response.statusCode);
}
class _TestState extends State<Test> {
  @override
  void initState() {
    data();
    // TODO: implement initState
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello'),),
    );
  }
}
