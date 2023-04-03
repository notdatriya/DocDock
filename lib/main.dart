import 'package:doc_dock/Screens/home_page.dart';
import 'package:doc_dock/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'Screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Lexend_Deca",
          primarySwatch: Colors.blue,
          brightness: Brightness.dark
      ),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
