
import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final String description;
  final String name;
  final String image;
  final String open_hrs;
  final String place_type;
  final DocumentReference reference;
  final GeoPoint location;

  Place.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['description'] != null),
        assert(map['name'] != null),
        assert(map['location'] != null),
        assert(map['image'] != null),
        assert(map['open_hrs'] != null),
        assert(map['place_type'] != null),
        description = map['description'],
        open_hrs = map['open_hrs'],
        place_type = map['place_type'],
        location = map['location'],
        image = map['image'],
        name = map['name'];

  Place.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Attraction $name";
}