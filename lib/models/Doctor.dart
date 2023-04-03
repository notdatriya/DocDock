//import 'package:http/http.dart' as http;
class Doctor {
  static List<Doctor> docList = [];

  final int doctorId;
  final String name;
  final String experience;
  final String clinic;
  final String speciality;
  final String imageURL;

  Doctor({
    this.doctorId = 0,
    this.speciality = "",
    this.name = "",
    this.experience = "0 yrs",
    this.clinic = "",
    this.imageURL = "",
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctorId'],
      speciality: json['speciality'],
      name: json['name'],
      experience: json['experience'],
      clinic: json['clinic'],
      imageURL: json['imageURL'],
    );
  }
}
