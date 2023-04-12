//import 'package:http/http.dart' as http;
import 'package:const_date_time/const_date_time.dart';

class Appointment {
  static List<Appointment> appList = [];

  final int appId;
  final String fname;
  final String lname;
  final DateTime date;
  final String speciality;
  final String slot;

  Appointment({
    this.appId = 0,
    this.fname = "",
    this.lname="",
    this.date= const ConstDateTime(0),
    this.speciality = "",
    this.slot=""

  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      // doctorId: json['doctor_id'],
      // speciality: json['Specialization'],
      // name: json['FirstName'],
      // experience: json['Years_of_experience'],
      // degree: json['Degree'],
      // imageURL: json['imageURL'],
    );
  }
}
