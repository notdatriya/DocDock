//import 'package:http/http.dart' as http;
class Slot {
  static List<Slot> slotList = [];

  final int slotId;
  final String text;
  final bool isSelected;

  Slot({
    this.slotId=0,
    this.text="",
    this.isSelected=false,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      slotId: json[''],
      text: json[''],
      // imageURL: json['imageURL'],
    );
  }
}
