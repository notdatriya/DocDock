import 'package:doc_dock/Screens/LoginPage.dart';
import 'package:doc_dock/Screens/home_page.dart';
import 'package:doc_dock/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'Screens/test.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          brightness: Brightness.dark),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
