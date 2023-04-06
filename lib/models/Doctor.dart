//import 'package:http/http.dart' as http;
class Doctor {
  static List<Doctor> docList = [];

  final int doctorId;
  final String name;
  final int experience;
  final String degree;
  final String speciality;
  final String imageURL;

  Doctor({
    this.doctorId = 0,
    this.speciality = "",
    this.name = "",
    this.experience = 0,
    this.degree = "",
    this.imageURL = "assets/profile_pic.png",
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctor_id'],
      speciality: json['Specialization'],
      name: json['FirstName'],
      experience: json['Years_of_experience'],
      degree: json['Degree'],
      // imageURL: json['imageURL'],
    );
  }
}
