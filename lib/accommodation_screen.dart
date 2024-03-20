import 'package:flutter/material.dart';
import 'accommodation/acm_tile_list.dart';

class AccommodationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accommodation"),
      ),
      body: AcmTileList()
    );
  }
}