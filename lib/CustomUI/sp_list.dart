
import 'package:flutter/material.dart';

import '../models/Speciality.dart';


// class SpecialityList extends StatefulWidget {
//   const SpecialityList({Key? key,required this.index,required this.spList,required this.stateSetter()}) : super(key: key);
//
//   final int index;
//   final List<Speciality> spList;
//   final VoidCallback stateSetter;
//   @override
//   State<SpecialityList> createState() => _SpecialityListState();
// }
//
// class _SpecialityListState extends State<SpecialityList> {
//   @override
//   Widget build(BuildContext context) {
//     return  ElevatedButton(
//       onPressed:() {
//         //this.stateSetter,
//         // for(int i =0;i<12;i++)
//         //    {
//         //      if(i==index)
//         //        spList[i].isSelected=true;
//         //      else
//         //        spList[i].isSelected=false;
//         //    }
//         // spList[index].isSelected=true;},
//       },
//
//     style:ElevatedButton.styleFrom(
//                 primary:spList[index].isSelected?Color(0xff6FBDB4):Color(0xff2A2C28),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//     ),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(0),
//         leading: CircleAvatar(child:Image.asset(spList[index].imageURL)),
//         title:Text(spList[index].name,style: TextStyle(color: spList[index].isSelected?Colors.black54:Colors.white70)),
//       ),
//     );
//   }
// }


class SpecialityList extends StatelessWidget {
  const SpecialityList({Key? key,required this.index,required this.spList}) : super(key: key);
  final int index;
  final List<Speciality> spList;
 // final bool isSelected;
 // final VoidCallback stateSetter;
  //final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed:(){
        //this.stateSetter,

        for (int i = 0; i < 12; i++) {
          if (i == index)
            spList[i].isSelected = true;
          else
            spList[i].isSelected = false;

        }
      },
      //   for (int i = 0; i < 12; i++) {
      //     if (i == index)
      //       spList[i].isSelected = true;
      //     else
      //       spList[i].isSelected = false;
      //   }
      // },
      // spList[index].isSelected=true;}

      style:ElevatedButton.styleFrom(
        primary:spList[index].isSelected?Color(0xff6FBDB4):Color(0xff2A2C28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(child:Image.asset(spList[index].imageURL)),
        title:Text(spList[index].name,style: TextStyle(color: spList[index].isSelected?Colors.black54:Colors.white70)),
      ),
    );
  }
}
