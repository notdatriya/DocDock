import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:doc_dock/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phController = new TextEditingController();
  TextEditingController _pdController = new TextEditingController();
  int loginStatus = 0;

  Future login(String phone_no, String passwordd) async {
    var url = Uri.parse('https://docdock.onrender.com/login');
    var requestBody = jsonEncode({
      "phone_no": phone_no,
      "passwordd": passwordd,
    });
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        },
        body: requestBody);

    Map<String, dynamic> responsei = jsonDecode(response.body.toString());
    setState(() {
      if (responsei['success'].toString() == "1") {
        loginStatus = 1;
      }
    });
    print(responsei['success']);
    print(response.statusCode);
    // return responsei['success'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff151413),
      body: SingleChildScrollView(
        reverse: true, // this is new
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            // Logo and title
            Container(
              height: height * .45,
              margin: EdgeInsets.only(top: 50),
              // child: Image.asset(
              //   'assets/logo.png',
              //   width: 150,
              //   height: height*.5,
              // ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: height * .44,
                decoration: BoxDecoration(
                  color: Color(0xff2A2C28),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  // Phone number text field
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff151413),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phController,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  // Password text field
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff151413),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.phone,
                      controller: _pdController,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //Sign in button
                  Container(
                    // margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        Text('Don\'t have an account?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.blueAccent),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Login button

                  GestureDetector(
                    onTap: () {
                      login(_phController.text, _pdController.text);
                      print(loginStatus);
                      if (loginStatus == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RootPage()));
                        loginStatus = 0;
                      } else {
                        print('Login failed');
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff6FBDB4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
