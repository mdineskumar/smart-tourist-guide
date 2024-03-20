import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smarttouristguide/place/place_tile.dart';

import 'package:smarttouristguide/place/place_view.dart';

import 'package:smarttouristguide/side_drawer.dart';
import 'package:smarttouristguide/accommodation/acm_view.dart';

import 'package:smarttouristguide/emergency/emergency_contact_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Testing Side Drawer', (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: SideDrawer(),
              ),
            ),
          );
        },
      ),
    );

    expect(find.text('Places'), findsOneWidget);
    expect(find.text('Accommodation'), findsOneWidget);
    expect(find.text('Emergency'), findsOneWidget);
  });

  testWidgets('Testing emergency contact (tile view)',
      (WidgetTester tester) async {
    var loc = new GeoPoint(5, 5);
    var data = new Dummy_Data_Emergency('name', 'description', 'contact', loc);
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: EmergencyTile(context, data),
              ),
            ),
          );
        },
      ),
    );

    expect(find.byIcon(Icons.local_hospital), findsWidgets);
    expect(find.byIcon(Icons.phone), findsWidgets);
  });

  testWidgets('Testing place (page view)', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      var loc = new GeoPoint(5, 5);
      var data = new Dummy_Data_Place(
          'name',
          'description',
          'open hrs',
          'type',
          'https://media-cdn.tripadvisor.com/media/photo-s/06/cb/d9/94/hikkaduwa-beach.jpg',
          loc);

      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              home: Material(
                child: Center(
                  child: PlaceView(context, data),
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Get Directions'), findsOneWidget);
      expect(find.text('Place details'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });

  testWidgets('Testing accommodation place (page view)',
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      var loc = new GeoPoint(5, 5);
      var data = new Dummy_Data_Acm(
          'name',
          'description',
          'address',
          'contact',
          'https://media-cdn.tripadvisor.com/media/photo-s/06/cb/d9/94/hikkaduwa-beach.jpg',
          loc);

      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              home: Material(
                child: Center(
                  child: AcmView(context, data),
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Get Directions'), findsOneWidget);
      expect(find.text('Place details'), findsOneWidget);
      expect(find.byIcon(Icons.phone), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });

  testWidgets('Testing place (tile view)', (WidgetTester tester) async {
    var loc = new GeoPoint(5, 5);
    var data = new Dummy_Data_Place(
        'name',
        'description',
        'open hrs',
        'type',
        'https://media-cdn.tripadvisor.com/media/photo-s/06/cb/d9/94/hikkaduwa-beach.jpg',
        loc);
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: PlaceTile(context, data),
              ),
            ),
          );
        },
      ),
    );

    expect(find.text('More Info'), findsOneWidget);
    expect(find.byIcon(Icons.location_on), findsOneWidget);
  });
}

class Dummy_Data_Emergency {
  final String description;
  final String name;
  final String contact;
  // final String open_hrs;
  // final String place_type;
  final GeoPoint location;

  Dummy_Data_Emergency(
      this.name, this.description, this.contact, this.location);
}

class Dummy_Data_Place {
  final String description;
  final String name;
  final String image;
  final String open_hrs;
  final String place_type;
  final GeoPoint location;

  Dummy_Data_Place(this.name, this.description, this.open_hrs, this.place_type,
      this.image, this.location);
}

class Dummy_Data_Acm {
  final String address;
  final String name;
  final String contact;
  final String image;
  final String description;
  final GeoPoint location;

  Dummy_Data_Acm(this.name, this.description, this.address, this.contact,
      this.image, this.location);
}
