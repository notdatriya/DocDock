class Appointment {
  static List<Appointment> appList = [];

  final String fname;
  final String lname;
  final String gender;
  final String slot;
  final int age;

  Appointment(
      {this.fname = "",
      this.lname = "",
      this.slot = "",
      this.gender = "",
      this.age = 0});
  // static List<Appointment> appList = [
  //   Appointment(
  //       fname: "Sanidhya",
  //       lname: "Kumar",
  //       slot: "3:30 To 4 Pm",
  //       gender: "Male",
  //       age: 19)
  // ];

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
        fname: json['FirstName'],
        lname: json['LastName'],
        slot: json['slot'],
        gender: json['gender'],
        age: json['age']);
  }
}
