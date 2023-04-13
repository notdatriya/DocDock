//import 'package:http/http.dart' as http;
import 'package:const_date_time/const_date_time.dart';

class Appointment {
  static List<Appointment> appList = [];

  final int appId;
  final String fname;
  final String lname;
  final String date;
  final String speciality;
  final String slot;

  Appointment(
      {this.appId = 0,
      this.fname = "",
      this.lname = "",
      // this.date = const ConstDateTime(0),
      this.date = "",
      this.speciality = "",
      this.slot = ""});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      // appId: json['doctor_id'],
      speciality: json['Specialization'],
      fname: json['FirstName'],
      lname: json['LastName'],
      date: json['_date'],
      slot: json['slot'],
    );
  }
}
