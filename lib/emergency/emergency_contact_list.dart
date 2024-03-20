import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import './emergency.dart';
import './emergency_contact_tile.dart';

class EmergencyContactList extends StatelessWidget {
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final place = Emergency.fromSnapshot(data);

    return EmergencyTile(context, place);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('emergency').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }
}
