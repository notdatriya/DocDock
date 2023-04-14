
import 'package:flutter/material.dart';

import 'Screens/Dashboard.dart';
import 'Screens/PatientDocumentsPage.dart';

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
      home: PatientDocuments(),
      debugShowCheckedModeBanner: false,
    );
  }
}

