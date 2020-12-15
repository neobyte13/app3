import 'package:cloud_firestore/cloud_firestore.dart';

class Ditem {
  final String pickup;
  final String delivery;
  final String name;
  final String phone;
  final String date;
  final String notes;
  final String owner;
  final DocumentReference reference;

  Ditem.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['pickup'] != null),
        assert(map['delivery'] != null),
        assert(map['name'] != null),
        assert(map['phone'] != null),
        assert(map['date'] != null),
        assert(map['notes'] != null),
        assert(map['owner'] != null),
        pickup = map['pickup'],
        delivery = map['delivery'],
        name = map['name'],
        phone = map['phone'],
        date = map['date'],
        notes = map['notes'],
        owner = map['owner'];

  Ditem.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Ditem<$name:$date>";
}
