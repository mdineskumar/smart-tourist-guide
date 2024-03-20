import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyTile extends StatelessWidget {
  final _data;

  EmergencyTile(_, this._data);

  _callPhone() async {
    if (await canLaunch('tel:' + _data.contact)) {
      await launch('tel:' + _data.contact);
    } else {
      throw 'Could not Call Phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.local_hospital,
              color: Colors.red,
            ),
            title: Text(_data.name),
            subtitle: Text(_data.description),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(_data.contact,style: TextStyle(color: Colors.blue),),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  onPressed: _callPhone,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
