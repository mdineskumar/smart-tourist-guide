
import 'package:cloud_firestore/cloud_firestore.dart';

class Acm {
  final String address;
  final String name;
  final String contact;
  final String image;
  final String description;
  final DocumentReference reference;
  final GeoPoint location;

  Acm.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['address'] != null),
        assert(map['name'] != null),
        assert(map['location'] != null),
        assert(map['contact'] != null),
        assert(map['image'] != null),
        assert(map['description'] != null),
        address = map['address'],
        location = map['location'],
        contact = map['contact'],
        name = map['name'],
        description = map['description'],
        image = map['image'];

  Acm.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Accommodation $name";
}