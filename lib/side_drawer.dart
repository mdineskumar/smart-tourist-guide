import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text('User not logged in')),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Places'),
            subtitle: Text('Attractions Nearby'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
          ListTile(
            title: Text('Accommodation'),
            subtitle: Text('Safer places to stay'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/accommodation');
            },
          ),
          ListTile(
            title: Text('Emergency',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            subtitle: Text('Emergency Contacts'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/emergency');
            },
          )
        ],
      ),
    );
  }
}
