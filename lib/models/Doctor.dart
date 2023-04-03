//
// //import 'package:http/http.dart' as http;
class Doctor {
  static List <Doctor> docList = [];

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

  factory Doctor.fromJson(Map<String, dynamic>json)
  {
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
//
//   // void getSenData() async {
//   //   var url = Uri.parse('http://192.168.137.214:300/sensor');
//   //   var response = await http.get(url);
//   //   setState(() {
//   //     docData = json.decode(response.body)['data'];
//   //     print(docData);
//   //     print('s');
//   //   });
//   // }
//   // @override
//   // void initstate()
//   // {
//   //   getSenData();
//   //   super.initState();
//   // }
//
//   //List of Doctors data
//   static List<Doctor> docList = [
//     Doctor(
//       doctorId: 0,
//       speciality: 'Cardiologist',
//       name: 'Dr. Goswami',
//       experience: "10+yrs",
//       clinic: 'Patika 5th block Gandhinagar',
//       imageURL: 'assets/profile_pic.png',
//     ),
//
//     Doctor(
//       doctorId: 1,
//       speciality: 'Dermatologist',
//       name: 'Dr. Tripathi',
//       experience: "11+yrs",
//       clinic: 'Patika 5th block Gandhinagar ',
//       imageURL: 'assets/profile_pic.png',
//     ),
//     Doctor(
//       doctorId: 2,
//       speciality: 'Dermatologist',
//       name: 'Dr. Tripathi',
//       experience: "11+yrs",
//       clinic: 'Patika 5th block Gandhinagar ',
//       imageURL: 'assets/profile_pic.png',
//     ),
//   ];
// }