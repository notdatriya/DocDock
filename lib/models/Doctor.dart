//import 'package:http/http.dart' as http;
class Doctor {
  static List<Doctor> docList = [];

  final int doctorId;
  final String name;
  final int experience;
  final String clinic;
  final String speciality;
  final String imageURL;

  Doctor({
    this.doctorId = 0,
    this.speciality = "",
    this.name = "",
    this.experience = 0,
    this.clinic = "",
    this.imageURL = "",
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctor_id'],
      speciality: json['Specialization'],
      name: json['FirstName'],
      experience: json['Years_of_experience'],
      // clinic: json['clinic'],
      // imageURL: json['imageURL'],
    );
  }
}
