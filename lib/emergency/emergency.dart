
import 'package:cloud_firestore/cloud_firestore.dart';

class Emergency {
  final String description;
  final String name;
  final String contact;
  final DocumentReference reference;
  final GeoPoint location;

  Emergency.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['description'] != null),
        assert(map['name'] != null),
        assert(map['location'] != null),
        assert(map['contact'] != null),
        description = map['description'],
        location = map['location'],
        contact = map['contact'],
        name = map['name'];

  Emergency.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Emergency Contact $name";
}