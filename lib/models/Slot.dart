//import 'package:http/http.dart' as http;
class Slot {
  static List<Slot> slotList = [];

  final int slotId;
  final String slot_text;
  final bool isSelected;

  Slot({
    this.slotId=0,
    this.slot_text="",
    this.isSelected=false,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      //slotId: json['slot'],
      slot_text: json['slot'],
      // imageURL: json['imageURL'],
    );
  }
}
