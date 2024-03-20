import 'package:flutter/material.dart';
import './side_drawer.dart';
import 'package:firebase_database/firebase_database.dart';

import './place/place_tile_list.dart';

class HomeScreen extends StatefulWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  final _locations = [];

  HomeScreen() {
    // print(this._locations);
  }

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: Text("Attractions"),
        ),
        body: Column(
          children: <Widget>[PlaceTileList()],
        ));
  }
}
