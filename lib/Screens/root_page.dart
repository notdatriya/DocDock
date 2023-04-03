
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'ambulance_page.dart';
import 'appointment_pages/appointment_page1.dart';
import 'appointment_pages/appointment_page2.dart';
import 'home_page.dart';
import 'medical_history_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> _widgetOptions() {
    return [
      HomePage(),
      AppointmentPage1(),
      AmbulancePage(),
      MedicalHistoryPage(),
    ];
  }

  List<Widget> iconList = [
    Icon(
      Icons.home,
      color: Colors.white70,
    ),
    Icon(
      Icons.calendar_month_outlined,
      color: Colors.white70,
    ),
    Icon(
      Icons.local_hospital,
      color: Colors.white70,
    ),
    Icon(
      Icons.assignment,
      color: Colors.white70,
    ),
    // Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2A2C28),
            body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        // backgroundColor: Colors.transparent,
        color: Color(0xff2A2C28),
        buttonBackgroundColor: Color(0xff6FBDB4),
        items: iconList,
        index: _bottomNavIndex,
        backgroundColor: Color(0xff151413),
        // backgroundColor: AppColors.bgcolor40percent,
        // buttonBackgroundColor: Colors.transparent,

        height: 60,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
