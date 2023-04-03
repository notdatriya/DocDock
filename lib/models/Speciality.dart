
class Speciality {
  final int index;
  final String name;
  final String imageURL;
  // final voidCallback onPressed;
  final String qualification;
  bool isSelected;

  Speciality({
    required this.index,
    this.name = "",
    this.imageURL = "",
    // this.onPressed={
    //   for(int i =0;i<12;i++)
    // {
    // if(i==this.index)
    // isSelected[i]=true;
    // else
    // isSelected[i]=false;
    // }
    //   },
    this.qualification="",
    this.isSelected=false

  });

  //List of Speciality
  static List<Speciality> spList = [
    Speciality(
        index:0,
        name: 'General Medicine',
        imageURL: 'assets/profile_pic.png',
        // onPressed:{}
        qualification: "MBBS"

    ),
    Speciality(
        index:1,
        name: 'Women\'s Health',
        imageURL: 'assets/profile_pic.png',
        qualification: "Gynaecologist"
    ),
    Speciality(
        index:2,
        name: 'Heart',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Cardiologist'
    ),
    Speciality(
        index:3,
        name: 'Skin & Hair',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Dermatologist'
    ),
    Speciality(
        index:4,
        name: 'Kidney & Urinary Issues',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Urologist'
    ),
    Speciality(
        index:5,
        name: 'Bone & Joints',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Orthopedic'
    ),
    Speciality(
        index:6,
        name: 'Child Specialist',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Pediatrician'
    ),
    Speciality(
        index:7,
        name: 'General Surgery',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Surgeon'
    ),
    Speciality(
        index: 8,
        name: 'Ayurveda',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Ayurvedic Expert'
    ),
    Speciality(
        index:9,
        name: 'Digestive Issues',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Gastroenterologist'
    ),
    Speciality(
        index: 10,
        name: 'Eye Specialist',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Opthalmologist'
    ),
    Speciality(
        index: 11,
        name: 'Dental Care',
        imageURL: 'assets/profile_pic.png',
        qualification: 'Dentist'
    ),
  ];

// static VoidCallback onPressed(int index)
// {
//    for(int i =0;i<12;i++)
//    {
//      if(i==Speciality.index)
//        isSelected[i]=true;
//      else
//        isSelected[i]=false;
//    }
// }

// static List<Food> getFavoritedFoods() {
//   List<Food> _travelList = Food.foodList;
//   return _travelList.where((element) => element.isFavorated == true).toList();
// }
}