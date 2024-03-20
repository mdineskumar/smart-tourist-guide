import 'package:flutter/material.dart';
import './emergency/emergency_contact_list.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency"),
      ),
      body: EmergencyContactList()
    );
  }
}